class Semtranscript(object):

    def average(self):
        n= len(self.courses_grade)
        semester1=0
        for n in self.courses_grade:
            semester1=n[1]+semester1
        return semester1/int(len(self.courses_grade))
    
    def __init__(self,student='',courses_grade=[()]):
        print('in constructor')
        self.student= student
        self.courses_grade= courses_grade
        self.average= self.average()

    def __str__(self):
        print('in str')
        
        grades=' '
        for item in self.courses_grade:
            
            course= str(item[0]) + ',' + str(item[1])
            grades= grades + course + ','
        
        
        return "{0}, course/grade:{1}{2}".format(self.student,grades,self.average)
    def __repr__(self):
        print('in repr')
        return self.__str__()
        

    def __add__(self,param):
        student= self.student + param.student
        courses_grade= self.courses_grade + param.courses_grade
        return Semtranscript(student,courses_grade)


         
        
        
        
