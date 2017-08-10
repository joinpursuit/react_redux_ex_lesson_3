describe("deepDup", () => {
  beforeEach( () => {
    robotParts = [
      ["nuts", "bolts", "washers"],
      ["capacitors", "resistors", "inductors"]
    ];
    
    copy = deepDup(robotParts);
  });

  it("makes a copy of the original array", () => {
    expect(copy).toEqual(robotParts);
  });

  it("deeply copies arrays", () => {
    copy[1].push("LEDs");
    expect(robotParts[1]).toEqual(["capacitors", "resistors", "inductors"]);
  });
});

describe("#digitalRoot", () => {
  it("calculates the digital root of a single-digit number", () => {
    expect(digitalRoot(9)).toEqual(9);
  });

  it("calculates the digital root of a larger number", () => {
    expect(digitalRoot(4322)).toEqual(2);
  });
  //
  // it("does not call #to_s on the argument", () => {
  //   expect_any_instance_of(Fixnum).to_not receive(:to_s)
  //   digitalRoot(4322);
  // });
});

describe('firstEvenNumbersSum', () => {
  it("Correctly returns the sum of the first even number", () => {
    expect(firstEvenNumbersSum(1)).toEqual(2);
  });

  it("Returns the sum of the first n even numbers", () => {
    expect(firstEvenNumbersSum(6)).toEqual(42);
  });
});

describe("#recSum", () => {
  it("returns the sums of all elements in an array", () => {
    arr = [1,2,3,4];
    expect(recSum(arr)).toEqual(10);
  });

  it("returns 0 if the array is empty", () => {
    expect(recSum([])).toEqual(0);
  });
});

