#include<iostream>
#include<fstream>
#include<string>
using namespace std;



int main() {
	ifstream infile;
	ofstream out;
	infile.open("ref_img.txt");
	out.open("ref.txt");
	if (!out) { cout << "open ref failed!"; return 0; }
	if (!infile) { cout << "open file failed!"; return 0; }


	int **array= new int *[2160+15];
	string buff;
	for (int k = 0; k < 2160+15; k++) {
		array[k] = new int[3840+16];
	}
	int i = 0+7,j = 0+8;

	for (i; i < 2160+7; i++) {
		for (j; j < 3840+8; j++) {
			if(!infile.eof())
			infile>>array[i][j];
		}
		j = 0+8;
	}

	for (i = 0; i<2160+15; i++) {
		if (i < 7 || (i >= 2160 + 7 && i < 2160 + 15)) {
			for (j = 0; j < 3840 + 16; j++) {
				array[i][j] = 0;
			}
		}
		j = 0;
	}

	for (j = 0; j < 3840 + 16; j++) {
		if (j < 8 || (j >= 3840 + 8 && j < 3840 + 16)) {
			for (i = 0; i < 2160 + 15; i++) {
				array[i][j] = 0;
			}
		}
		i = 0;
	}
	

	int x_count = 0, y_count = 0;
	for (y_count; y_count < 270; y_count++) {
		for (x_count; x_count < 480; x_count++) {
			if (x_count == 0) {
				for (j = 0; j <= 22; j++) {
					for (i = 0; i <= 23; i++) {
						out << array[y_count * 8 + j][i] << '\n';
					}
				}
			}
			else {
				for (j = 0; j <= 22; j++) {
					for (i = 0; i <= 7; i++) {
						out << array[y_count * 8 + j][(x_count-1) * 8 +24+ i] << '\n';
					}
				}
			}
		}
		x_count = 0;
	}


	infile.close();
	out.close();
}