 class StudentInfo {
public:
   StudentInfo() { myGPA = 0.0; myHours = 0; }
   StudentInfo(double gpa, int hours) { myGPA = gpa; myHours = hours; }

private:
   double myGPA;
   int    myHours;
};
