#include <iostream>
using namespace std;

int main():{
    int num_of_ticket,discount,cost;

    do
    {
        cout << "how many tiickets would you like to buy?";
        cin >> num_of_ticket;
    } while (num_of_ticket < 0 or num_of_ticket > 26);
 if (num_of_ticket < 10)
    {
        discount = 1;
    }
else if (num_of_ticket <26)
{
    discount = 0.9;
}

else
{
    discount = 0.8;
}

cost = num_of_ticket * 20 * discount;
cout << "your tickets cost: " << cost;
}
    