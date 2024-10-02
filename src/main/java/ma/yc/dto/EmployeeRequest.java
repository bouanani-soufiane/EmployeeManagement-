package ma.yc.dto;

public record EmployeeRequest (
    String name,
    String email,
    String phone,
    String position,
    String department
){
}
