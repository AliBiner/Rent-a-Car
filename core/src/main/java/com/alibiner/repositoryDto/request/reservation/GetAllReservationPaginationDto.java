package com.alibiner.repositoryDto.request.reservation;

import java.util.*;

public record GetAllReservationPaginationDto(int totalCount, List<ReservationPersistenceDto> reservations) {

}
