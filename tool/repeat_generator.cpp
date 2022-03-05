#include <iostream>
#include <string>
#include <vector>
using namespace std;

int main() {
    string s;
    string s1;
    vector<int> pos;
    size_t rpt;

    cout << "$ A tool help repeat the number of verilog modules by step of 1"
         << endl;

    while (1) {
        cout << endl << "$ enter repeat times" << endl;
        cin >> rpt;
        getchar();

        cout << endl << "$ enter sentence, use # to replace number" << endl;
        getline(cin, s);
        cout << endl;

        // 查找所有的0，储存在pos中，注意查找下一个时位置要+1
        pos.push_back(s.find("#"));
        while (s.find("#", pos.back() + 1) != string::npos) {
            pos.push_back(s.find("#", pos.back() + 1));
        }

        for (size_t i = 0; i < rpt; i++) {
            s1.assign(s);
            for (size_t j = 0; j < pos.size(); j++) {
                s1.replace(
                    s1.begin() + pos[j] + (to_string(i).size() - 1) * j,
                    s1.begin() + pos[j] + 1 + (to_string(i).size() - 1) * j,
                    to_string(i));
                // 这里要注意三个坑：
                // 1. 如果replace函数的参数不是常数，那么就必须用iteration的方法
                // 2. 替换一个字符，结尾位置+1
                // 3. 替换的字符超过一个字符长度，那么要加偏置量
            }
            cout << s1 << endl;
        }

        pos.clear();
        s.clear();
    }

    getchar();
    getchar();
    return 0;
}