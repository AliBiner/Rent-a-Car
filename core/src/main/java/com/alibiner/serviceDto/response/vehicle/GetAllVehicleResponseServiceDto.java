package com.alibiner.serviceDto.response.vehicle;

import java.util.*;

public record GetAllVehicleResponseServiceDto(int totalCount, List<VehicleResponseServiceDto> dto) {
}
