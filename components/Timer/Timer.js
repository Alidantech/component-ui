/**
 * TimerComponent - A timer component with start, pause, resume, stop, restart, and reset functionality.
 * @class
 */
class TimerComponent {
  /**
   * Create a TimerComponent instance.
   */
  constructor() {
    /**
     * The time to be counted down in milliseconds.
     * @type {number}
     */
    this.timerTime = 0;

    /**
     * The timestamp when the timer started.
     * @type {number}
     * @private
     */
    this.startTime = 0;

    /**
     * Indicates whether the timer is currently running.
     * @type {boolean}
     * @private
     */
    this.running = false;

    /**
     * The elapsed time in milliseconds.
     * @type {number}
     * @private
     */
    this.elapsedTime = 0;

    /**
     * The interval ID for updating the timer display.
     * @type {number}
     * @private
     */
    this.interval = null;

    /**
     * Event handler for tick (timer updates).
     * @callback TimerComponent~onTick
     * @param {number} elapsedTime - The elapsed time in milliseconds.
     */

    /**
     * Event handler for timer start.
     * @callback TimerComponent~onStart
     * @param {number} elapsedTime - The elapsed time in milliseconds.
     */

    /**
     * Event handler for timer pause.
     * @callback TimerComponent~onPause
     * @param {number} elapsedTime - The elapsed time in milliseconds.
     */

    /**
     * Event handler for timer resume.
     * @callback TimerComponent~onResume
     * @param {number} elapsedTime - The elapsed time in milliseconds.
     */

    /**
     * Event handler for timer stop.
     * @callback TimerComponent~onStop
     * @param {number} elapsedTime - The elapsed time in milliseconds.
     */

    /**
     * Event handler for timer reset.
     * @callback TimerComponent~onReset
     */

    /**
     * Event handler property for tick (timer updates).
     * @type {TimerComponent~onTick}
     */
    this.onTick = null;

    /**
     * Event handler property for timer start.
     * @type {TimerComponent~onStart}
     */
    this.onStart = null;

    /**
     * Event handler property for timer pause.
     * @type {TimerComponent~onPause}
     */
    this.onPause = null;

    /**
     * Event handler property for timer resume.
     * @type {TimerComponent~onResume}
     */
    this.onResume = null;

    /**
     * Event handler property for timer stop.
     * @type {TimerComponent~onStop}
     */
    this.onStop = null;

    /**
     * Event handler property for timer reset.
     * @type {TimerComponent~onReset}
     */
    this.onReset = null;
  }

  /**
   * Set the timer time in seconds.
   * @param {number} timeInSeconds - The time to set for the timer in seconds.
   */
  setTimerTime(timeInSeconds) {
    this.timerTime = timeInSeconds * 1000; // Convert seconds to milliseconds
  }

  /**
   * Start the timer.
   */
  start() {
    if (!this.running) {
      if (this.elapsedTime >= this.timerTime) {
        this.elapsedTime = 0;
      }
      this.startTime = Date.now() - this.elapsedTime;
      this.running = true;
      this.emitEvent(this.onStart);
      this.interval = setInterval(() => {
        this.elapsedTime = Date.now() - this.startTime;
        this.emitEvent(this.onTick);
        if (this.elapsedTime >= this.timerTime) {
          this.pause();
          this.emitEvent(this.onStop);
        }
      }, 1000);
    }
  }

  /**
   * Pause the timer.
   */
  pause() {
    if (this.running) {
      this.running = false;
      clearInterval(this.interval);
      this.emitEvent(this.onPause);
    }
  }

  /**
   * Resume the timer after pausing.
   */
  resume() {
    if (!this.running) {
      this.start();
      this.emitEvent(this.onResume);
    }
  }

  /**
   * Stop the timer and reset it to zero.
   */
  stop() {
    this.pause();
    this.elapsedTime = 0;
    this.emitEvent(this.onStop);
  }

  /**
   * Restart the timer (stop and start again).
   */
  restart() {
    this.stop();
    this.start();
  }

  /**
   * Reset the timer to zero.
   */
  reset() {
    this.running = false;
    this.elapsedTime = 0;
    clearInterval(this.interval);
    this.emitEvent(this.onReset);
  }

  /**
   * Emit an event using the provided event handler.
   * @param {Function} handler - The event handler function to be called.
   * @param {number} [elapsedTime] - The elapsed time to pass to the event handler.
   */
  emitEvent(handler, elapsedTime) {
    if (typeof handler === 'function') {
      handler(elapsedTime);
    }
  }
}

export { TimerComponent };
