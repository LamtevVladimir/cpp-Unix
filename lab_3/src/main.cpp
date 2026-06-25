#include <iostream>
#include <string>
#include <vector>
#include <bitset>

using namespace std;

int main(){
	double num1, num2;
	unsigned int power;
	double result = 1.0;
	char operation, status;
	do {
		cout << "Первое число: ";
		cin >> num1;
		cout << "Операция: ";
		cin >> operation;
		switch (operation)
		{
		case'+':
			cout << "Второе число: ";
			cin >> num2;
			cout << "Result: " << num1 + num2 << endl;
			break;
		case'-':
			cout << "Второе число: ";
			cin >> num2;
			cout << "Result: " << num1 - num2 << endl;
			break;
		case'^':
			cout << "Второе число (положительное, целое): ";
			cin >> power;
			for (int i = 0; i<power; i++) {
				result *= num1;
			}
			cout << "Result: " << result << endl;
			break;
		default:
			cout << "Ошибка ввода" << endl;
		}
		cout << "Введите y/Y для повтора:";
		cin >> status;
		cout << endl << endl;
	} while (status == 'y' || status == 'Y');

	return 0;
}