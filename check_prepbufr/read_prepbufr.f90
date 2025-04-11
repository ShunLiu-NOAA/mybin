program read_prepbufr
  implicit none

  integer :: iret, lunin, msgtype, subset_index, nmsg
  character(len=8) :: subset
  character(len=80) :: msgtyp_str

  real(8) :: r8val(10)
  integer :: nval
  INTEGER*8 idate

  real(8) :: rval, slat, slon, dhr, rpt
  character(len=8) sid 
  equivalence (sid, rval)

 
  

  ! Logical unit number for input PREPBUFR file
  lunin = 11

  open(11,file='prepbufr',form='unformatted')

  call openbf(11, 'IN', lunin)
  call datelen(10)  ! Set length of date to 10 characters (yyyymmddhh)

  nmsg = 0
  do
    call readmg(lunin, subset, idate, iret)
    if (iret /= 0) exit  ! End of file

    call readsb(lunin, iret)
    if (iret /= 0) cycle

    nmsg = nmsg + 1
    !print *, 'Message:', nmsg, ' Subset:', subset

    ! Example: try to get station ID ('SID') and location ('CLAT', 'CLON')
    nval = 4
    call ufbint(lunin, r8val, 5, 1, iret, 'SID XOB YOB DHR RPT')
    rval=r8val(1)
    slat=r8val(2)
    slon=r8val(3)
    dhr=r8val(4)
    rpt=r8val(5)
    if (iret > 0) then
      write(6,'(a10,4f8.2)')sid, slat, slon, dhr, rpt
      !print *, 'SID, CLAT, CLON:', r8val(1:3)
    endif
  end do

  call closbf(lunin)

  print *, 'Finished reading PREPBUFR file.'

end program read_prepbufr

