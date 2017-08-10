// Using recursion and the is_a? method,
// write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

function deepDup(arr) {
  const array = arr.slice(0);
  if (array.length < 2) {
    return array;
  }
  return [array[0]].concat(deepDup(array.slice(1)));
}

// Write a method, `digital_root(num)`. It should Sum the digits of a positive
// integer. If it is greater than 10, sum the digits of the resulting number.
// Keep repeating until there is only one digit in the result, called the
// "digital root". **Do not use string conversion within your method.**
//
// You may wish to use a helper function, `digital_root_step(num)` which performs
// one step of the process.

function digitalRoot(num) {
  return 1 + ((num - 1) % 9);
}

// return the sum of the first n even numbers recursively. Assume n > 0

function firstEvenNumbersSum(n) {

}

// Write a recursive method that returns the sum of all elements in an array

function recSum(nums) {

}
