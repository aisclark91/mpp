PROGRAM ping_pong
IMPLICIT NONE
INCLUDE 'mpif.h'

INTEGER :: IERR, numproc, rank
INTEGER :: a=0, atmp1, atmp2


CALL MPI_INIT(IERR)
CALL MPI_COMM_RANK(MPI_COMM_WORLD, rank, IERR)
CALL MPI_COMM_SIZE(MPI_COMM_WORLD, numproc, IERR)

IF(rank == 0) THEN
   a = 5     
   atmp1 = a
ENDIF

IF(rank == 2) THEN
   a = 7
   atmp2 = a 
END IF

WRITE(*,*) 'a: ', a, 'rank: ', rank


CALL MPI_SSEND(atmp1, 1, MPI_INTEGER, 2, 0, MPI_COMM_WORLD)
CALL MPI_RECV(a, 1, MPI_INTEGER, 0, 0, MPI_COMM_WORLD, IERR)

WRITE(*,*) 'a:', a, 'rank: ', rank

CALL MPI_FINALIZE(IERR)

STOP 0
ENDPROGRAM
