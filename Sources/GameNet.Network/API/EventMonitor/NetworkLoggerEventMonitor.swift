////
////  NetworkLoggerEventMonitor.swift
////
////  Created by Alliston Aleixo on 18/05/22.
////
//
//import Alamofire
//import Pulse
//
//struct NetworkLoggerEventMonitor: EventMonitor {
//    let logger: NetworkLogger
//
//    func request(_ request: Request, didCreateTask task: URLSessionTask) {
//        logger.logTaskCreated(task)
//    }
//
//    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
//        logger.logDataTask(dataTask, didReceive: data)
//    }
//
//    func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
//        logger.logTask(task, didFinishCollecting: metrics)
//    }
//
//    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
//        logger.logTask(task, didCompleteWithError: error)
//    }
//}
