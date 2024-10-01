package ma.yc.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "employees")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "employee_seq")
    private Long id;

    @NotBlank(message = "the name is required")
    @Size(min = 3 , max = 100 , message = "name should be between 2 and 100 char")
    private String name;

    @NotBlank(message = "the email is required")
    @Email(message = "email should be valid")
    private String email;

    @NotBlank(message = "the phone is required")
    @Size(min = 10 , max = 15 , message = "the phone number need to be between 10 and 15 char")
    private String phone;

    @NotBlank(message = "Department is required")
    private String department;

    @NotBlank(message = "Position is required")
    private String position;


    public Long id () {
        return id;
    }

    public Employee setId ( Long id ) {
        this.id = id;
        return this;
    }

    public @NotBlank(message = "the name is required") @Size(min = 3, max = 100, message = "name should be between 2 and 100 char") String name () {
        return name;
    }

    public Employee setName ( @NotBlank(message = "the name is required") @Size(min = 3, max = 100, message = "name should be between 2 and 100 char") String name ) {
        this.name = name;
        return this;
    }

    public @NotBlank(message = "the email is required") @Email(message = "email should be valid") String email () {
        return email;
    }

    public Employee setEmail ( @NotBlank(message = "the email is required") @Email(message = "email should be valid") String email ) {
        this.email = email;
        return this;
    }

    public @NotBlank(message = "the phone is required") @Size(min = 10, max = 15, message = "the phone number need to be between 10 and 15 char") String phone () {
        return phone;
    }

    public Employee setPhone ( @NotBlank(message = "the phone is required") @Size(min = 10, max = 15, message = "the phone number need to be between 10 and 15 char") String phone ) {
        this.phone = phone;
        return this;
    }

    public @NotBlank(message = "Department is required") String department () {
        return department;
    }

    public Employee setDepartment ( @NotBlank(message = "Department is required") String department ) {
        this.department = department;
        return this;
    }

    public @NotBlank(message = "Position is required") String position () {
        return position;
    }

    public Employee setPosition ( @NotBlank(message = "Position is required") String position ) {
        this.position = position;
        return this;
    }
}
