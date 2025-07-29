/**
 * @param {number} n
 * @return {Function} counter
 */
const createCounter = function (n) {
  let count = 0;
  return function () {
    ++count;
    if (count === 1) {
      return n;
    } else {
      return ++n;
    }
  };
};

const counter = createCounter(10);
counter(); // 10
counter(); // 11
counter(); // 12
