function palindrome(value) {
  let valueWithNoSpaces = value.replace(/\s/g,'');
  if (value === value.split('').reverse().join('')) {
      return 'It`s a palindrome';
  } else if (valueWithNoSpaces === valueWithNoSpaces.split('').reverse().join('')) {
      return 'It`s a palindrome, no spaces';
  }
  return 'It`s not a palindrome';
}

Задачи:
  1) найти в массиве [3, 2, 1, 2, 1, 4, 5, 8, 6, 7, 4, 2] максимальное расстояние между двумя вхождениями элемента.
    Пример:
максимальное расстояние для 2 это 10
  2) найти элемент в массиве   [15, 16, 19, 20, 25, 1, 3, 4, 5, 7, 10, 14]
можно поменять задачи порядком. 2я очень простая, 1я чуть посложнее
реализация на руби и жс