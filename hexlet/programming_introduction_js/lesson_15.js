//myMathModule.js
export function getTriangleArea(h, b) {return 1 / 2 * h * b;}

//solution.js
import getTriangleArea from './myMathModule.js';

export default (n) => {return 1 / 2 * n * (square(n) / 2);}
