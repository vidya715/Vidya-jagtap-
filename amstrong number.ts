let numberToCheck: number = 155;
let numString: string = numberToCheck.toString();
let numDigits: number = numString.length;
let sum: number = 0;

for (let i = 0; i < numDigits; i++) {
    const digit: number = parseInt(numString[i]);
    sum += Math.pow(digit, numDigits);
}

if (sum === numberToCheck) {
    console.log(`${numberToCheck} is an Armstrong number.`);
} else {
    console.log(`${numberToCheck} is not an Armstrong number.`);
}
