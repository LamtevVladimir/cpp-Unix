import time


def f(x):
    """Вычисление выражения: x^2 - x^2 + 4*x - 5*x + x + x"""
    return x**2 - x**2 + 4 * x - 5 * x + x + x


flag = 0
try:
    n = int(input("Type a number of iterations: "))
except ValueError:
    print("Invalid value")
    flag = 1
print(1)
while (n > 0) and (flag == 0):
    x = 0.13
    accum = 0.0

    start = time.perf_counter()  # высокоточный таймер (аналог chrono)

    for i in range(n):
        accum += f(x)

    end = time.perf_counter()
    delta = end- start

    print('Time for ',n,' iterations: ',delta,' seconds')

    try:
        print("For repeat type a number of iterations: ", end="")
        print("Accumulated value ",accum)
        n = int(input())
    except ValueError:
          print("Invalid value")
          flag = 1