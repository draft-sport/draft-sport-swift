//
//  Draft Sport Error
//  DraftSport
//
//  Created by Hugh Jeremy on 29/2/20.
//

import Foundation


public class DraftSportError: Error, CustomStringConvertible {

    public let kind: Kind
    public let message: String
    
    public var description: String { get { return self.message }}
    
    internal init(_ kind: Kind) {
        self.kind = kind
        message = kind.rawValue
        return
    }
    
    public enum Kind: String {
        case jsonParseFailed = """
        Draft Sport Swift was unable to parse the JSON sent by the Draft Sport \
        . This likely indicates a bug, please considering opening an issue on \
        GitHub.
        """
        case badResponse = """
        Draft Sport Swift library was not able to understand the response sent \
        by the Draft Sport. If this happens repeatedly, there may be a bug in \
        the API.
        """
        case inconsistentState = """
        Draft Sport Swift has entered an unexpected state from which it cannot \
        recover. Please consider filing a bug report on GitHub.
        """
        case notFound = "A requested resource could not be found"
        case notAuthorised = """
        You are not authorised to access a requested resource.
        """
        case notAuthenticated = """
        Your request was not authenticated. Your Session may have expired or \
        been deleted. Consider creating a new Session.
        """
        case badRequest = """
        The Draft Sport could not understand your request, it may be missing a \
        required parameter, or be composed of incorrect types. It is the \
        responsibility of this library (Draft Sport Swift) to supply correctly \
        formed requests, so please consider filing a bug report on GitHub.
        """
        case genericServerError = """
        The Draft Sport replied with a generic error response, indicating that \
        it has failed internally. Either Makara is experiencing temporary \
        disruption, or there is a bug in the API.
        """
        case constraintViolated = """
        Input data violates a constraint. For example, a description may be \
        too long.
        """
        case subscriptionProblem = """
        Your Makara subscription does not allow you to perfom this action. \
        Your payment method may have expired, or your plan may be disabled. \
        Please visit https://Makara.io/billing or contact support@Makara.io
        """
        case serviceDisruption = """
        Makara is experiencing a service disruption. This should be \
        temporary. Check the @Makaraapi Twitter feed and \
        https://Makara.io/blog/ for service updates.
        """
        case rateLimit = """
        You have hit the Draft Sport rate limiter. You might try batching your \
        requests (e.g. creating 10 Transactions at once). If your \
        implementation requires a higher rate limit, or your believe you are \
        being erroneously limited (e.g. behind a corporate or university NAT), \
        please contact support@makara.io
        """
        case notImplemented = """
        The requested functionality is not yet implemented by Draft Sport Swift
        """
    }
}

