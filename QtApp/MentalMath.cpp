#include "MentalMath.h"

MentalMath::MentalMath()
{
	qDebug() << "MentalMath constructor";

	// looking for mentalmath configuration saved in settings.json file
	control = Controller::getInstance();
	digitsN1 = control->getMentalMathSettings("n1");
	digitsN2 = control->getMentalMathSettings("n2");

	generateEquation();
}

void MentalMath::generateEquation()
{
	/* initialize random seed: */
	srand(time(NULL));

	if (digitsN1.compare("1") == 0) {
		/* generate numbers between 0 and 9: */
		n1 = rand() % 9;
	}
	else if (digitsN1.compare("2") == 0) {
		n1 = rand() % 99;
	}

	// generate digits for n2
	if (digitsN2.compare("1") == 0) {
		n2 = rand() % 9;
	}
	else if (digitsN2.compare("2") == 0) {
		n2 = rand() % 99;
	}
}

void MentalMath::setNumberDigits(std::string n1, std::string n2)
{
	this->digitsN1 = n1;
	this->digitsN2 = n2;
}

int MentalMath::getN1()
{
	return n1;
}

int MentalMath::getN2()
{
	return n2;
}

std::string MentalMath::getDigitsN1()
{
	return digitsN1;
}

std::string MentalMath::getDigitsN2()
{
	return digitsN2;
}

int MentalMath::getAnswer()
{
	return n1 * n2;
}
