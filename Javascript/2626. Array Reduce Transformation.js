/**
 * @param {number[]} nums
 * @param {Function} fn
 * @param {number} init
 * @return {number}
 */
var reduce = function (nums, fn, init) {
  let result = init;
  for (let i = 0; i < nums.length; i++) {
    result = fn(result, nums[i]);
  }
  return result;
};

console.log(reduce([1, 2, 3, 4], (a, b) => a + b, 0)); // ➜ 10

console.log(reduce([1, 2, 3, 4], (a, b) => a + b * b, 100)); // ➜ 130

console.log(reduce([], (a, b) => a + b, 25)); // ➜ 25
