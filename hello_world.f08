program hello_world
IMPLICIT NONE
include 'mpif.h'

integer :: a, IERR
integer :: rank, numproc

CALL MPI_INIT(IERR)
CALL MPI_COMM_RANK(MPI_COMM_WORLD, rank, IERR)
CALL MPI_COMM_SIZE(MPI_COMM_WORLD, numproc, IERR)

WRITE(*,*) 'Hello World'

CALL MPI_FINALIZE(IERR)
stop 0
endprogram


