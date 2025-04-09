// MARK: - OpenAI Request Models
struct OpenAIRequest: Encodable {
    let model: String
    let messages: [Message]
    let temperature: Double
    let response_format: ResponseFormat
}

struct Message: Encodable {
    let role: String
    let content: String
}

struct ResponseFormat: Encodable {
    let type: String
}
