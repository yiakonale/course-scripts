opts = detectImportOptions('course_grades_2023.xlsx');
opts = setvartype(opts, {'ID_Number', 'Name'}, 'string');
table = readtable('course_grades_2023.xlsx', opts);

disp("3TP3 Question 2");
disp("-");
labMark(table);
examMark(table);
finalMark(table);

%%d
newRows = {'Ioannis Papaspyridis', 'papaspyi', 1, 2, 3, 4, 5, 1, 2, 3, 4;
            'Danial Noori Zadeh', 'noorizad', 2, 3, 4, 5, 6, 2, 3, 4, 5};
table = [table;newRows];
disp("Part D");
table

%%a
function [maxName, maxGrade] = labMark(table)
    newTable = table(2:end, :);
    gradeSum = newTable.Lab_1 + newTable.Lab_2 + newTable.Lab_3 + newTable.Lab_4;
    maxGrade = max(gradeSum);
    maxIndex = gradeSum == maxGrade;
    maxName = newTable.Name(maxIndex);
    disp("Part A")
    disp(maxName);
    disp(maxGrade);
    disp("==============================");
end

%%b
function [maxName, maxGrade] = examMark(table)
    newTable = table(2:end, :);
    gradeSum = newTable.Exam_1 + newTable.Exam_2 + newTable.Exam_3 + newTable.Exam_4;
    maxGrade = max(gradeSum);
    maxIndex = gradeSum == maxGrade;
    maxName = newTable.Name(maxIndex);
    disp("Part B")
    disp(maxName);
    disp(maxGrade);
    disp("==============================");
end

%%c
function [maxName, maxGrade] = finalMark(table)
    newTable = table(2:end, :);
    gradeSum = newTable.Lab_1 + newTable.Lab_2 + newTable.Lab_3 + newTable.Lab_4 + ...
        newTable.Midterm + newTable.Exam_1 + newTable.Exam_2 + newTable.Exam_3 + newTable.Exam_4;
    maxGrade = max(gradeSum);
    maxIndex = gradeSum == maxGrade;
    maxName = newTable.Name(maxIndex);
    disp("Part C")
    disp(maxName);
    disp(maxGrade);
    disp("==============================");
end