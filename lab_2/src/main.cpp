#include <iostream>
#include <chrono>

using namespace std;


float f(float x) {

	return x*x -x*x + 4*x - 5*x + x + x;

}

int main() {
    int n = 1337;
    cout << "Type a number of iterations: ";
	cin >> n;
    if (cin.fail()) {
		cout << "Invalid value" << endl;
		return 1;
		}
	while (n > 0) {
		

		float x = 0.13;
		float accum = 0.0;
		auto start = chrono::high_resolution_clock::now();

		for (int i = 0; i < n; i++) {
			accum += f(x);
		}

		auto end = chrono::high_resolution_clock::now();
		chrono::duration<double> delta = end - start;
		cout << "Time for " << n << " iterations: " << delta.count() << " seconds" << endl;

		cerr << "Accumulated value " << accum << endl;

		cout << "For repeat type a number of iterations: ";
		cin >> n;
        if (cin.fail()) {
			cout << "Invalid value" << endl;
			return 1;
		}}
	return 0;
}