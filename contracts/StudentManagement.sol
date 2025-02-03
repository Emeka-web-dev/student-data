// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract StudentManagement {
        address owner;

            constructor() {
                        owner = msg.sender;
            }

                modifier onlyOwner() {
                            require(msg.sender == owner, "You are not the admin");
                                    _;
                }

                    enum Gender { Male, Female }

                        mapping(uint8 => Student) students;

                            // Events
                                event CreatedStudent(
                                            string indexed name,
                                                    string indexed class,
                                                            uint8 indexed age
                                );

                                    event UpdatedStudent(
                                                uint8 indexed studentId,
                                                        string name,
                                                                string class,
                                                                        uint8 age,
                                                                                Gender gender
                                    );

                                        event DeletedStudent(
                                                    uint8 indexed studentId
                                        );

                                            struct Student {
                                                        string name;
                                                                uint8 age;
                                                                        string class;
                                                                                Gender gender;
                                            }

                                                uint8 studentId = 0;

                                                    // Register a new student
                                                        function registerStudent(
                                                                    string memory _name,
                                                                            uint8 _age,
                                                                                    string memory _class,
                                                                                            Gender _gender
                                                        ) external onlyOwner {
                                                                    Student memory student = Student({
                                                                                    name: _name,
                                                                                                age: _age,
                                                                                                            class: _class,
                                                                                                                        gender: _gender
                                                                    });

                                                                            studentId++;
                                                                                    students[studentId] = student;

                                                                                            emit CreatedStudent(_name, _class, _age);
                                                        }

                                                            // Get details of a specific student
                                                                function getStudent(uint8 _studentId) public view returns (Student memory student_) {
                                                                            require(_studentId > 0 && _studentId <= studentId, "Invalid student ID");
                                                                                    student_ = students[_studentId];
                                                                }

                                                                    // Get details of all students
                                                                        function getStudents() public view returns (Student[] memory students_) {
                                                                                    students_ = new Student[](studentId);

                                                                                            for (uint8 i = 1; i <= studentId; i++) {
                                                                                                            students_[i - 1] = students[i];
                                                                                            }

                                                                                                    return students_;
                                                                        }

                                                                            // Update student details
                                                                                function updateStudent(
                                                                                            uint8 _studentId,
                                                                                                    string memory _name,
                                                                                                            uint8 _age,
                                                                                                                    string memory _class,
                                                                                                                            Gender _gender
                                                                                ) external onlyOwner {
                                                                                            require(_studentId > 0 && _studentId <= studentId, "Invalid student ID");

                                                                                                    Student storage student = students[_studentId];
                                                                                                            student.name = _name;
                                                                                                                    student.age = _age;
                                                                                                                            student.class = _class;
                                                                                                                                    student.gender = _gender;

                                                                                                                                            emit UpdatedStudent(_studentId, _name, _class, _age, _gender);
                                                                                }

                                                                                    // Delete a student
                                                                                        function deleteStudent(uint8 _studentId) external onlyOwner {
                                                                                                    require(_studentId > 0 && _studentId <= studentId, "Invalid student ID");

                                                                                                            delete students[_studentId];
                                                                                                                    emit DeletedStudent(_studentId);
                                                                                        }

                                                                                            // Get the total number of students
                                                                                                function getStudentCount() public view returns (uint8) {
                                                                                                            return studentId;
                                                                                                }
}
                                                                                                }
                                                                                        }
                                                                                }
                                                                                )
                                                                                            }
                                                                        }
                                                                }
                                                                    })
                                                        }
                                                        )
                                            }
                                        )
                                    )
                                )
                }
            }
}