export default function addDigits(value) {
  let acc = 0;

  for (let i = 0; i < String(value).length; i++) {
    acc += Number(String(value)[i]);
  }

  if (String(acc).length > 1) {
    return addDigits(acc);
  }

  return acc;
}
