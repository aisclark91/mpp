PROGRAM ping_pong
IMPLICIT NONE
INCLUDE 'mpif.h'

INTEGER :: IERR, numproc, rank
INTEGER :: a=0, atmp


CALL MPI_INIT(IERR)
CALL MPI_COMM_RANK(MPI_COMM_WORLD, rank, IERR)
CALL MPI_COMM_SIZE(MPI_COMM_WORLD, numproc, IERR)


!-----Initialize a----------


IF(rank == 1) THEN
   a = 5
ELSEIF(rank == 2) THEN
   a = 7
ENDIF


!----Prints the initial state ------
WRITE(*,*) 'before a: ', a, 'rank: ', rank
!-----------------------------------

!---First exchange attempt----------
IF(rank == 1) THEN     
   CALL MPI_SEND(a, 1, MPI_INT, 2, 0, MPI_COMM_WORLD, IERR)
   a = 7
ELSE IF(rank == 2) THEN
   CALL MPI_RECV(a, 1, MPI_INT, 1, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE, IERR)
ENDIF
!----------------------------------


!---Write After the exchange----------
WRITE(*,*) 'after a: ', a, 'rank: ', rank
!-------------------------------------

CALL MPI_FINALIZE(IERR)

STOP 0
ENDPROGRAM
