//
//  Ticker.swift
//  SwiftXtend
//
//  Created by José Donor on 25/11/2018.
//

/// Source : https://github.com/100mango/SwiftTimer/blob/master/Sources/SwiftTimer.swift


public final class Ticker {

	/// Block triggered when ticking.
	public var didTick: (Ticker) -> Void
	/// Tick count
	public var count: Int = 0

	/// Interval
	public let interval: DispatchTimeInterval
	/// If false the timer will stop after its first fireing
	public let isRepeating: Bool
	/// Delay
	public var delay: DispatchTimeInterval
	/// Leeway
	public var leeway: DispatchTimeInterval


	/// Timer
	private let timer: DispatchSourceTimer
	/// Timer is running
	private var isRunning = false
	/// Lock
	private let lock = NSLock()


	// MARK: - Initialize

	public init(interval: DispatchTimeInterval,
				isRepeating: Bool = true,
				delay: DispatchTimeInterval,
				leeway: DispatchTimeInterval,
				on queue: DispatchQueue,
				didTick: @escaping (Ticker) -> Void) {

		self.interval = interval
		self.isRepeating = isRepeating
		self.delay = delay
		self.leeway = leeway
		self.didTick = didTick

		timer = DispatchSource.makeTimerSource(queue: queue)
		timer.setEventHandler { [weak self] in
			guard let self = self else { return }
			self.count += 1
			self.didTick(self)
		}

		if isRepeating { timer.schedule(deadline: .now() + delay, repeating: interval, leeway: leeway) }
		else { timer.schedule(deadline: .now() + delay, leeway: leeway) }

	}

	public static func create(interval: DispatchTimeInterval,
							  isRepeating: Bool = true,
							  delay: DispatchTimeInterval,
							  leeway: DispatchTimeInterval,
							  on queue: DispatchQueue,
							  didTick: @escaping (Ticker) -> Void) -> Ticker {

		return Ticker(interval: interval,
					  isRepeating: isRepeating,
					  delay: delay,
					  leeway: leeway,
					  on: queue,
					  didTick: didTick)
	}

	public static func every(_ interval: DispatchTimeInterval,
							 leeway: DispatchTimeInterval = .seconds(0),
							 on queue: DispatchQueue,
							 didTick: @escaping (Ticker) -> Void) -> Ticker {

		return Ticker(interval: interval,
					  isRepeating: true,
					  delay: .seconds(0),
					  leeway: .seconds(0),
					  on: queue,
					  didTick: didTick)
	}

	public static func after(_ delay: DispatchTimeInterval,
							 on queue: DispatchQueue,
							 didTick: @escaping (Ticker) -> Void) -> Ticker {

		return Ticker(interval: .seconds(0),
					  isRepeating: false,
					  delay: delay,
					  leeway: .seconds(0),
					  on: queue,
					  didTick: didTick)
	}

	deinit {
		start()
		stop()
	}


	/// Start the ticker
	@discardableResult
	public func start() -> Ticker {
		lock.lock()
		defer { lock.unlock() }

		if !isRunning {
			isRunning = true
			timer.resume()
		}

		return self
	}

	/// Pause the ticker
	public func pause() {
		lock.lock()
		defer { lock.unlock() }

		if isRunning {
			isRunning = false
			timer.suspend()
		}
	}

	/// Stop ticker
	public func stop() {
		timer.cancel()
	}

	/// Tick manually
	public func tick() {
		if isRepeating { didTick(self) }
		else {
			didTick(self)
			timer.cancel()
		}
	}

}
