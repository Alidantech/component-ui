/**
 * Timer component for creating and managing timers.
 * @module Timer
 */

let startTime = 0;      // Initial start time (in milliseconds)
let timerInterval = 0;  // Interval ID for the timer
let elapsedTime = 0;    // Elapsed time (in milliseconds)
let isRunning = false;  // Indicates if the timer is currently running

/**
 * Starts the timer.
 */
function start() {
  if (!isRunning) {
    startTime = Date.now() - elapsedTime;
    timerInterval = setInterval(update, 1000);
    isRunning = true;
  }
}

/**
 * Pauses the timer.
 */
function pause() {
  if (isRunning) {
    clearInterval(timerInterval);
    elapsedTime = Date.now() - startTime;
    isRunning = false;
  }
}

/**
 * Resumes the timer if paused.
 */
function resume() {
  if (!isRunning) {
    start();
  }
}

/**
 * Stops the timer and resets it to 0.
 */
function stop() {
  clearInterval(timerInterval);
  elapsedTime = 0;
  isRunning = false;
}

/**
 * Restarts the timer from 0.
 */
function restart() {
  stop();
  start();
}

/**
 * Resets the timer to 0 without stopping it.
 */
function reset() {
  elapsedTime = 0;
}

/**
 * Updates the timer display.
 */
function update() {
  const currentTime = Date.now();
  elapsedTime = currentTime - startTime;
  displayTime(elapsedTime);
}

/**
 * Displays the timer in a specific format.
 * @param {number} time - The time to display (in milliseconds).
 */
function displayTime(time) {
  const seconds = Math.floor(time / 1000);
  const minutes = Math.floor(seconds / 60);
  const hours = Math.floor(minutes / 60);

  // Format the time (HH:MM:SS)
  const formattedTime = `${String(hours).padStart(2, '0')}:${String(minutes % 60).padStart(2, '0')}:${String(seconds % 60).padStart(2, '0')}`;
  console.log(formattedTime);
}

export { start, pause, resume, stop, restart, reset };
