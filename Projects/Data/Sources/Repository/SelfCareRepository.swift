import RxSwift

import Domain
import MGNetworks

public class SelfCareRepository: SelfCareRepositoryInterface {

    private let networkService: SelfCareService

    public func getMyRoutineData() -> Single<SelfCareMyRoutineModel> {
        return networkService.requestMyRoutineData()
    }

    public init(networkService: SelfCareService) {
        self.networkService = networkService
    }
}