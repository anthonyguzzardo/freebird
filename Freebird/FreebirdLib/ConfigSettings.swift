import Definitions

public class ConfigSettings {

    private var isLoaded: Bool = false
    private var config: AppConfig!

    private init() {
        tryLoadConfig()
    }

    private func tryLoadConfig() {
        guard !isLoaded else { return }

        guard let url = Bundle.main.url(forResource: "config", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode(AppConfig.self, from: data) else {
            fatalError("Failed to load or decode config.json")
        }

        self.config = decoded
        self.isLoaded = true
    }

    public var mapWidth: Int {
        return config.map.widthInt
    }

    public var mapHeight: Int {
        return config.map.heightInt
    }

}
