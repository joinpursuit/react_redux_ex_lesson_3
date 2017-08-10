// write String.prototype.mySlice. It should take a start index and an
// (optional) end index.

String.prototype.mySlice = function(ind1, ind2) {
  const string = this;
  const arr = string.split("");
  const answer = [];

  if (typeof(ind2) === "undefined") {
    ind2 = arr.length;
  }

  for (let i = 0; i < arr.length; i++) {
    if (i < ind1 || i > ind2 - 1) {
      continue;
    } else {
      answer.push(arr[i]);
    }
  }
  return answer.join("");
}

// write Array.prototype.myReduce (analogous to Ruby's Array#inject).

Array.prototype.myReduce = function(callback, starter) {
  const arr = this;

  if (typeof(starter) === "undefined") {
    starter = arr.shift();
  }

  arr.forEach ((el) => {
    starter = callback(starter, el);
  });

  return starter;
}

// write Array.prototype.quickSort(comparator). Here's a quick refresher if
// you've forgotten how quickSort works:
//   - choose a pivot element from the array (usually the first)
//   - for each remaining element of the array:
//     - if the element is less than the pivot, put it in the left half of the
//     array.
//     - otherwise, put it in the right half of the array.
//   - recursively call quickSort on the left and right halves, and return the
//   full sorted array.

Array.prototype.quickSort = function(comparator) {

  if (this.length <= 1) {
    return this;
  }

  const arr = this;

  if (typeof(comparator) !== "function") {
    comparator = function(x, y) {
      if (x > y) {
        return 1;
      }
      if (x === y) {
        return 0;
      }
      if (x < y) {
        return -1;
      }
    };
  }

  const pivot = arr[0];
  const left = [];
  const right = [];

  for (let i = 1; i < arr.length; i++) {
    if (comparator(arr[i], pivot) === -1) {
      left.push(arr[i]);
    }
    else {
      right.push(arr[i]);
    }
  }
  console.log(left);

  return left.quickSort(comparator).concat([pivot]).concat(right.quickSort(comparator));
}

// write myFind(array, callback). It should return the first element for which
// callback returns true, or undefined if none is found.

function myFind(array, callback) {
  return array.forEach (function(el) {
    if (callback(el) === true) {
      return el;
    }
  });
}

// write sumNPrimes(n)

function sumNPrimes(n) {
  const arr = [];

  for (let i = 2; arr.length < n; i++) {
    if (isPrime(i)) {
      arr.push(i);
    }
  }

  if (arr.length === 0) {
    return 0;
  }

  return arr.reduce((acc, el) => acc + el);
}

function isPrime(num) {
  if (num < 2) {
    return false;
  }

  for (let i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }

  return true;
}

// write Function.prototype.myBind.

Function.prototype.myBind = function(ctx, ...bindArgs) {
  return (...callArgs) => {
    return this.apply(ctx, bindArgs.concat(callArgs));
  }
}

// write Function.prototype.inherits.

Function.prototype.inherits = function(Parent) {
  function Surrogate(){}
  Surrogate.prototype = Parent.prototype;
  this.prototype = new Surrogate;
  this.prototype.constructor = this;
}
