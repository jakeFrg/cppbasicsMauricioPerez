int sumPositive(int array[], int size) {
    int sum = 0;

    for (int i = 0; i < size; ++i) {
        if (array[i] >= 0) {
            sum += array[i];
        }
    }

    return sum;
}