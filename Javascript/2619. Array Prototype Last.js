/**
 * @return {null|boolean|number|string|Array|Object}
 */
Array.prototype.last = function () {
  return this.length === 0 ? -1 : this[this.length - 1];
};

const arr1 = [null, {}, 3];
console.log(arr1.last());

const arr2 = [];
console.log(arr2.last());
