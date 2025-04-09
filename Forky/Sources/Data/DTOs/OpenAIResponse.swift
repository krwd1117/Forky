// MARK: - OpenAI Response Models
struct OpenAIResponse: Decodable {
    let choices: [Choice]
}

struct Choice: Decodable {
    let message: ResponseMessage
}

struct ResponseMessage: Decodable {
    let content: String
}
