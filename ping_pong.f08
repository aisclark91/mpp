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
WRITE(*,*) 'a: ', a, 'rank: ', rank
!-----------------------------------

CALL MPI_BARRIER

!---First exchange attempt----------
IF(rank == 1) THEN     
   CALL MPI_SEND(a, 1, MPI_INTEGER, 2, 0, MPI_COMM_WORLD, IERR)
ELSE IF(rank == 2) THEN
   CALL MPI_RECV(atmp, 1, MPI_INTEGER, 1, 0, MPI_COMM_WORLD, IERR)
   a = atmp
ENDIF
!----------------------------------


!---Write After the exchange----------
WRITE(*,*) 'a: ', a, 'rank: ', rank
!-------------------------------------

CALL MPI_FINALIZE(IERR)

STOP 0
ENDPROGRAM
