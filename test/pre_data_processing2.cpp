#include<iostream>
#include<fstream>
using namespace std;


void de_to_bi(int x, char *array);
int main() {
	char bi[9];
	int x;
	int line=0;
	ifstream in;
	ofstream out;

	in.open("ref.txt");
	out.open("ref_bi.txt");
	if (!in) { cout << "open error"; return 0; }
	if (!out) { cout << "write error"; return 0; }

	while (!in.eof()) {
		for (int i = 0; i < 8; i++) {
			in >> x;
			de_to_bi(x, bi);
			out << bi;
		}
		line++;
		out << "\n";
		cout << line << endl;
	}
	/**while (1) {
		cout << "input x:";
		cin >> x;
		de_to_bi(x, bi);
		cout << bi<<endl;
	}**/
}

void de_to_bi(int x, char *array) {
	for (int i = 0; i < 8; i++) {
		array[7 - i] = (x % 2)+'0';
		x = x / 2;
	}
	array[8] = '\0';
}