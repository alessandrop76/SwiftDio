import UIKit

//Concorrencia é quando há simultâniedade em tarefas no sistema
//antes da versão 5.5 era usado GCD Grand Central Dipatch - gerencia codigo tarefas e filas, executa em paralelo conforme capacidade da plataforma, após 5.5 foi implementado assync await

//GCD
let startTime = CFAbsoluteTime()
DispatchQueue.global().sync {
    for i in 0...10 {
        print("Fui... \(i)")
    }
}
DispatchQueue.global().sync {
    for i in 0...10 {
        print("Voltei... \(i)")
    }
}

/*Main thread exemplo
    DispatchQueue.main.sync {
            //Executando na main thread
    }
*/

// async await
func fetchUserId(from server : String) async -> Int {
    if server == "primary" {
        return 97
    }else if server == "secundary" {
        return 501
    }
    return 510
}

func fetchUsername(from server : String) async -> String {
    let userId = await fetchUserId(from: server)
    if userId == 501 {
        return "João Souza"
    }
    return "Convidado"
}

func connectUser(to server: String) async {
    async let userId = fetchUserId(from: server)
    async let username = fetchUsername(from: server)
    let greeting = await "Olá \(username), user ID \(userId)"
    print(greeting)
}

//para executar as funções assíncronas é necessário usar Task
Task {
    await connectUser(to: "secundary")
}

//ex.........................

let gallery = [
    "Summer Vacation": ["praia.png", "campo.png", "zoo.png", "shooping.png"],
    "Road Trip": ["paris.png", "roma.png", "bahia.png", "madri.png"],
]

func listPhotos(inGallery name:String) async -> [String] {
    //simulação de chamada assíncrona usando do catch
    do{
        try await Task.sleep(until: .now + .seconds(3), clock: .continuous)
    } catch{}
    return gallery[name] ?? []
}

Task {
    let photoNames = await listPhotos(inGallery: "Road Trip")
    let sortedNames = photoNames.sorted()
    let name = sortedNames[0]
}

func add(_ photo: String, toGallery: String) {
    print("Adicionando a foto \(photo) na Galeria \(toGallery)")
}
func remove(_ photo: String, fromGallery: String) {
        print("Removendo a foto \(photo) da Galeria \(fromGallery)")
}

Task {
    let firstPhoto = await listPhotos(inGallery: "Summer Vacation")[0]
    add(firstPhoto, toGallery: "Road Trip")
    //.....momento em que a foto está nas duas galerias antes de ser removida
    remove(firstPhoto, fromGallery: "Summer Vacation")
}

func move(_ photoName: String, from source: String, to destination: String) {
    add(photoName, toGallery: destination)
    remove(photoName, fromGallery: source)
}

//fazendo um interação assíncrona

Task {
    let handle = FileHandle.standardInput
    for try await line in handle.bytes.lines {
        print(line)
    }
}

func downloadPhoto(named: String) async -> Data {
    //simular chamada no backend
    do {
        try await Task.sleep(until: .now + .seconds(3), clock: .continuous)
    } catch{}
    return Data()
}
Task {
    let photoNames = await listPhotos(inGallery: "Summer Vacation")
    
    async let firstPhoto = downloadPhoto(named: photoNames[0])
    async let secondPhoto = downloadPhoto(named: photoNames[1])
    async let thirdPhoto = downloadPhoto(named: photoNames[2])
    
    let photos = await [firstPhoto, secondPhoto, thirdPhoto]
}

//grupo de tarefas - simultâniedade estruturada

Task {
    await withTaskGroup(of: Data.self) {TaskGroup in
        let photoNames = await listPhotos(inGallery: "Summer Vacation")
        for name in photoNames {
            TaskGroup.addTask{await downloadPhoto(named: name)}
        }
    }
}

Task {
    let photo = await listPhotos(inGallery: "Summer Vacation")[0]
    let handle = Task {
        return await downloadPhoto(named: photo)
    }
    let result = await handle.value
}

//atores
actor TemperatureLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int
    
    init(label: String, measurement: Int){
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
}

Task {
    let logger = TemperatureLogger(label: "Ao ar livre", measurement: 25)
    print(await logger.max)
}

extension TemperatureLogger {
    func update(with measurement: Int) {
        measurements.append(measurement)
        if measurement > max {
            max = measurement
        }
    }
}


struct TemperatureReading: Sendable {
    var measurement: Int
}
extension TemperatureLogger {
    func addReading(from reading: TemperatureReading){
        measurements.append(reading.measurement)
    }
}
Task {
    let logger = TemperatureLogger(label: "Chaleira", measurement: 85)
    let reading = TemperatureReading(measurement: 45)
    await logger.addReading(from: reading)
}
