package ma.yc.dto;

public record EmployeeResponse(
        Long id,
        String name,
        String email,
        String phone,
        String position,
        String department
) {
}
