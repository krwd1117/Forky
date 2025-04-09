import Foundation
import ForkyDomain

public final class DIContainer: ObservableObject {
    public let useCase: UseCases

    public init(useCase: UseCases) {
        self.useCase = useCase
    }
}
