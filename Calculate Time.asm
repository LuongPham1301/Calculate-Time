	.data
TIME: .space 10
TIME2: .space 10
TIME3: .space 10
TIMEresult: .space 20

jan: .asciiz "January"
feb: .asciiz "February"
march: .asciiz "March"
apr: .asciiz "April"
may: .asciiz "May"
jun: .asciiz "June"
jul: .asciiz "July"
aug: .asciiz "August"
sep: .asciiz "Septemper"
oct: .asciiz "October"
nov: .asciiz "November"
dec: .asciiz "December"

mon: .asciiz "Monday"
tue: .asciiz "Tuesday"
wed: .asciiz "Wednesday"
thu: .asciiz "Thurday"
fri: .asciiz "Friday"
sat: .asciiz "Saturday"
sun: .asciiz "Sunday"

sign: .asciiz "/"

nhapngay: .asciiz "Nhap ngay Date:"
nhapthang: .asciiz "Nhap thang Month:"
nhapnam: .asciiz "Nhap nam Year:"

namNhuan: .asciiz "La nam nhuan!"
namKhongNhuan: .asciiz "Khong la nam nhuan!"
namNhuanKeTiep: .asciiz "\n2 nam nhuan ke tiep la: "
dautab: .asciiz "\t"

inKhoangCach: .asciiz "Khoang thoi gian giua hai moc thoi gian la: "

text1: .asciiz "-----Hay chon 1 trong cac thao tac duoi day-----\n"
text2: .asciiz "1. Xuat chuoi TIME theo dinh dang DD/MM/YYYY\n"
text3: .asciiz "2. Chuyen doi chuoi TIME thanh mot trong cac dinh dang sau\n"
text4: .asciiz "\tA. MM/DD/YYYY (Nhap A)\n"
text5: .asciiz "\tB. Month DD, YYYY (Nhap B)\n"
text6: .asciiz "\tC. DD Month, YYYY (Nhap C)\n"
text7: .asciiz "3. Cho biet ngay vua nhap la thu may trong tuan\n"
text8: .asciiz "4. Kiem tra nam trong chuoi TIME co phai nam nhuan khong\n"
text9: .asciiz "5. Cho biet khoang thoi gian giua hai chuoi TIME_1 va TIME_2\n"
text10: .asciiz "6. Cho biet nam nhuan gan nhat voi nam trong chuoi\n"
textKQ: .asciiz "\nKet qua la: "
enter: .asciiz "\n"
nam: .asciiz " nam"

textBalance: .asciiz "------------------------------------------"
textSelect: .asciiz "Lua chon: "

textFlase: .asciiz "Nhap sai, vui long nhap lai: "
	.text
	.globl main

main: 
	addi $v0,$0,4
	la $a0,nhapngay
	syscall
	
	addi $v0,$0,5
	syscall
	add $s0,$0,$v0		#$s0 Ngay

	addi $a1,$0,0		#gan #a1=0
	add $a0,$0,$s0		#gan $a0=$s0
	jal daoso		#dao so

	add $s0,$0,$v0		#luu gia tri dao vao $s0, $s0=$v0

	la $a1,TIME		#gan $a1=0
	add $a0,$0,$s0		#gan $a0=$s0
	jal convert		#chuyen sang chuoi
	slt $t3, $a3, $a2	#neu chieu dai chuoi chuyen doi nho hon chuoi goc thi can dong bo hoa
	bne $t3, $0, syn
	j continue
syn:				#dong bo hoa: them 0 vao cho chuoi moi cho toi khi chieu dai bang chieu dai cu
	addi $t0, $0, 1
	sub $a2, $a2, $t0
	
	addi $t0, $0, 48
	
	sb $t0, ($v0)
	addi $v0, $v0, 1
	
	slt $t0, $a3, $a2
	bne $t0, $0, syn
continue:
	add $s0,$0,$v0		#gan gia tri chuoi ve $s0
	la $s0,TIME		#gan ve TIME
	
	addi $v0,$0,4
	la $a0,nhapthang
	syscall
	
	addi $v0,$0,5
	syscall
	add $s1,$0,$v0		#$s1 Thang
	
	addi $a1,$0,0		#gan #a1=0
	add $a0,$0,$s1		#gan $a0 = $s1 (thang)
	jal daoso		#dao so

	add $s1,$0,$v0		#luu gia tri dao vao $s1, $s1=$v0

	la $a1,TIME2		#gan $a1=0
	add $a0,$0,$s1		#gan $a0=$s1
	jal convert		#chuyen sang chuoi

	add $s1,$0,$v0		#gan gia tri chuoi ve $s1
	la $s1,TIME2		#gan ve TIME
	slt $t3, $a3, $a2	#neu chieu dai chuoi chuyen doi nho hon chuoi goc thi can dong bo hoa
	bne $t3, $0, syn2
	j continue2
syn2:				#dong bo hoa: them 0 vao cho chuoi moi cho toi khi chieu dai bang chieu dai cu
	addi $t0, $0, 1
	sub $a2, $a2, $t0
	
	addi $t0, $0, 48
	
	sb $t0, ($v0)
	addi $v0, $v0, 1
	
	slt $t0, $a3, $a2
	bne $t0, $0, syn2
continue2:

	addi $v0,$0,4
	la $a0,nhapnam
	syscall
	
	addi $v0,$0,5
	syscall
	add $s2,$0,$v0		#$s2 Nam
	
	addi $a1,$0,0		#gan #a1=0
	add $a0,$0,$s2		#gan $a0 = $s2 (Nam)
	jal daoso		#dao so

	add $s2,$0,$v0		#luu gia tri dao vao $s2, $s2=$v0

	la $a1,TIME3		#gan $a1=0
	add $a0,$0,$s2		#gan $a0=$s2
	jal convert		#chuyen sang chuoi
	slt $t3, $a3, $a2	#neu chieu dai chuoi chuyen doi nho hon chuoi goc thi can dong bo hoa
	bne $t3, $0, syn3
	j continue3
syn3:				#dong bo hoa: them 0 vao cho chuoi moi cho toi khi chieu dai bang chieu dai cu
	addi $t0, $0, 1
	sub $a2, $a2, $t0
	
	addi $t0, $0, 48
	
	sb $t0, ($v0)
	addi $v0, $v0, 1
	
	slt $t0, $a3, $a2
	bne $t0, $0, syn3
continue3:
	add $s2,$0,$v0		#gan gia tri chuoi ve $s2
	la $s2,TIME3		#gan ve TIME
	
 #xuat menu
	addi $v0,$0,4
	la $a0,text1
	syscall

	addi $v0,$0,4
	la $a0,text2
	syscall

	addi $v0,$0,4
	la $a0,text3
	syscall

	addi $v0,$0,4
	la $a0,text4
	syscall

	addi $v0,$0,4
	la $a0,text5
	syscall

	addi $v0,$0,4
	la $a0,text6
	syscall

	addi $v0,$0,4
	la $a0,text7
	syscall

	addi $v0,$0,4
	la $a0,text8
	syscall

	addi $v0,$0,4
	la $a0,text9
	syscall

	addi $v0,$0,4
	la $a0,text10
	syscall

	addi $v0,$0,4
	la $a0,textBalance
	syscall

	addi $v0,$0,4
	la $a0,textSelect
	syscall

# lua chon
Select:
	addi $v0,$0,12		#Nhap lua chon
	syscall
	add $t1,$v0,$0		#Bien lua chon luu vao $t0

	addi $t0, $0, '1'
	beq $t1, $t0, Require1

	addi $t0, $0, 'A'
	beq $t1, $t0, Require2A

	addi $t0, $0, 'B'
	beq $t1, $t0, Require2B

	addi $t0, $0, 'C'
	beq $t1, $t0, Require2C

	addi $t0, $0, '3'
	beq $t1, $t0, Require3

	addi $t0, $0, '4'
	beq $t1, $t0, Require4

	addi $t0, $0, '5'
	beq $t1, $t0, Require5

	addi $t0, $0, '6'
	beq $t1, $t0, Require6

	la $s0, textFlase
	addi $a0, $s0, 0
	addi $v0, $0, 4
syscall
	j Select

Require1:
	la $a0,TIME
	la $a1,TIME2
	la $a2,TIME3
	la $a3,TIMEresult
	
	jal toString
	add $s0,$v0,$0
	la $s0,TIMEresult
	
	addi $v0,$0,4
	la $a0,textKQ
	syscall

	addi $v0,$0,4
	la $a0,TIMEresult
	syscall

	j exit


Require2A:
	la $a0,TIME2
	la $a1,TIME
	la $a2,TIME3
	la $a3,TIMEresult

	jal toString
	add $s0,$v0,$0
	la $s0,TIMEresult
	
	addi $v0,$0,4
	la $a0,textKQ
	syscall

	addi $v0,$0,4
	la $a0,TIMEresult
	syscall

	j exit


Require2B:
	la $a0, TIME
	la $a1, TIME2
	la $a2, TIME3
	la $a3, TIMEresult

	addi $sp,$0,-16
	sw $a3,12($sp)		# ketqua
	sw $a2,8($sp)		# nam
	sw $a1,4($sp)		# thang
	sw $a0,0($sp)		# ngay

	lw $a0,4($sp)
	addi $a1,$0,0
	addi $a2,$0,10
	jal toInt
	add $s0,$0,$v0

	add $a0,$s0,$0
	jal printMonth
	add $s1,$0,$v0
	

	add $a0,$0,$s1
	lw $a1,0($sp)
	lw $a2,8($sp)
	lw $a3,12($sp)

	jal toStringVer2
	add $s2,$0,$v0
	la $s2,TIMEresult

	addi $v0,$0,4
	la $a0,textKQ
	syscall

	addi $v0,$0,4
	la $a0,TIMEresult
	syscall

	j exit


Require2C:
	la $a0, TIME
	la $a1, TIME2
	la $a2, TIME3
	la $a3, TIMEresult

	addi $sp,$0,-16
	sw $a3,12($sp)		# ketqua
	sw $a2,8($sp)		# nam
	sw $a1,4($sp)		# thang
	sw $a0,0($sp)		# ngay

	lw $a0,4($sp)
	addi $a1,$0,0
	addi $a2,$0,10
	jal toInt
	add $s0,$0,$v0

	add $a0,$s0,$0
	jal printMonth
	add $s1,$0,$v0
	

	lw $a0,0($sp)
	add $a1,$0,$s1
	lw $a2,8($sp)
	lw $a3,12($sp)

	jal toStringVer2
	add $s2,$0,$v0
	la $s2,TIMEresult

	addi $v0,$0,4
	la $a0,textKQ
	syscall

	addi $v0,$0,4
	la $a0,TIMEresult
	syscall

	j exit

Require3:
	la $a0, TIME		#doi TIME3(dang mang gia tri ngay) ve int
	addi $a1,$0, 0
	addi $a2,$0, 10
	jal toInt		
	add $s3, $0, $v0	#luu ngay vao $s3, se la d
	add $a3, $0, $s3


	la $a0, TIME2		#doi TIME3(dang mang gia tri thang) ve int
	addi $a1,$0, 0
	addi $a2,$0, 10
	jal toInt		
	add $t1, $0, $v0	#luu thang vao $t1
	
	la $a0, TIME3		#doi TIME3(dang mang gia tri nam) ve int
	addi $a1,$0, 0
	addi $a2,$0, 10
	jal toInt		
	add $t2, $0, $v0	#luu nam vao $t2
	
	add $a0, $0, $t1	#luu a0 = t1	
	jal synMonth		#chuan hoa thang tuong ung voi bang thang
	add $s4, $0, $v0	#luu gia tri vua chuan hoa vao $s4, ,se la m
	add $a3, $a3, $s4
	
	addi $v0,$0,4
	la $a0,textKQ
	syscall
	
	addi $t3, $0, 100
	div $t2, $t3		#chia nam cho 100
	mflo $s5		#$s5 chua thuong cua phep chia
	mfhi $s6		#$s6 chua so du cua phep chia, se la y
	add $a3, $a3, $s6
	
	
	addi $t3, $0, 4		#lay ket qua vua chia duoc chia cho 4
	div $s5, $t3
	mfhi $a1
	jal synCentury		#chuan hoa gia tri the ki
	add $s5, $0, $v0	#luu vao $s5 la gia tri c
	add $a3, $a3, $s5

	
	addi $t3, $0, 4
	div $s6, $t3		#chia y cho 4
	mflo $s7		#$s7 chua ket qua tron duoi
	add $a3, $a3, $s7
	add $a0, $0, $s7
#lay phan du cho 7
	addi $t0, $0, 7
	div $a3, $t0
	mfhi $a0	#$a0 chua so du cua phep chia
	jal printDay
	j exit
	
Require4:
	la $a0, TIME3		#doi TIME3(dang mang gia tri nam) ve int
	addi $a1,$0, 0
	addi $a2,$0, 10
	jal toInt		
	add $t0, $0, $v0	#luu gia tri nam vao $t0
	
	addi $v0,$0,4
	la $a0,textKQ
	syscall
	
	addi $t1, $0, 400
	div $t0, $t1
	mfhi $t2
	beq $t2, $0, result
	addi $t1, $0, 4
	div $t0, $t1
	mfhi $t2
	beq $t2, $0, result2
return:
	la $a0, namKhongNhuan
	addi $v0, $0, 4
	syscall
	addi $v0, $0, 0
	j exit

Require5:
	addi $v0,$0,4
	la $a0, enter
	syscall
	
	addi $v0,$0,4
	la $a0,nhapngay
	syscall
	
	addi $v0,$0,5
	syscall
	add $s0,$0,$v0		#$s0 Ngay1
	
	addi $v0,$0,4
	la $a0,nhapthang
	syscall
	
	addi $v0,$0,5
	syscall
	add $s1,$0,$v0		#$s1 thang1
	
	addi $v0,$0,4
	la $a0,nhapnam
	syscall
	
	addi $v0,$0,5
	syscall
	add $s2,$0,$v0		#$s2 nam1
	
	addi $v0,$0,4
	la $a0,nhapngay
	syscall
	
	addi $v0,$0,5
	syscall
	add $s3,$0,$v0		#$s3 Ngay2
	
	addi $v0,$0,4
	la $a0,nhapthang
	syscall
	
	addi $v0,$0,5
	syscall
	add $s4,$0,$v0		#$s4 thang2
	
	addi $v0,$0,4
	la $a0,nhapnam
	syscall
	
	addi $v0,$0,5
	syscall
	add $s5,$0,$v0		#$s5 nam2
	
	slt $t0, $s2, $s5		#so sanh hai nam voi nhau
	bne $t0, $0, tinhKhoangCach
	
	sub $t0, $s2, $s5		#tru va in ket qua
	addi $v0, $0, 4
	la $a0, inKhoangCach
	syscall
	
	addi $v0, $0, 1
	add $a0, $0, $t0
	syscall
	
	addi $v0, $0, 4
	la $a0, nam
	syscall
	j exit
Require6:

	la $a0,TIME3
	addi $a1,$0,0
	addi $a2,$0,10
	jal toInt

	add $s0,$0,$v0

	add $a0,$s0,$0
	jal KiemTraNamNhuan
	add $t0,$0,$v0		# kiem tra nam vua nhap co la nam nhua
	
	add $s1,$0,$s0		# $s1 la nam ke tiep da la nhuan chua ( gan o day de thuc hien o nhan TH1)	
	addi $t1,$0,0		
	beq $t0,$t1,TH1
	
	addi $s1,$s1,4
	j Continue	


TH1:	
	addi $s1,$s1,1
	add $a0,$0,$s1
	jal KiemTraNamNhuan
	
	add $t0,$0,$v0		# co hieu kiem tra nam vua nhap co la nam nhua
	
	addi $t1,$0,0		
	beq $t0,$t1,TH1		# neu co hieu $t0 == 1 la nam khong nhuan

Continue:
	
	addi $s2,$s1,4
	
	addi $v0,$0,4
	la $a0,namNhuanKeTiep
	syscall

	addi $v0,$0,4
	la $a0,dautab
	syscall

	addi $v0,$0,1
	add $a0,$s1,$0
	syscall 
	
	addi $v0,$0,4
	la $a0,dautab
	syscall

	addi $v0,$0,1
	add $a0,$s2,$0
	syscall 

	j exit
#############################################
#############################################
daoso:
	addi $t0,$0,10		#gan $t0=10
	
	div $a0, $t0		#chia $a0 va $ $t0
	addi $a2, $a2, 1
	mfhi $t1		#phan du luu trong $t1
	mflo $a0		#phan thuong luu trong $a0

	mult $a1,$t0		#nhan $a1 cho 10
	mflo $a1		# a1=a1*10

	add $a1,$a1,$t1		#cong $a1 += $t1
	
	bne $a0,$0,daoso	# neu a0 != 0 thuc hien dao tiep
	add $v0,$0,$a1		# con khong thi gan $v0=$a1
	jr $ra

convert:
	addi $t0,$0,10		#gan $t0=10
	
	div $a0,$t0		#chia $a0 va $ $t0
	mfhi $t1		#phan du luu trong $t1
	mflo $a0		#phan thuong luu trong $a0
	addi $a3, $a3, 1
	
	addi $t1,$t1,48		#chuyen phan du sang chuoi $t0 = $t0 + 48

	sb $t1, ($a1)		#gan con tro thu i cua $a1 = $t0
	addi $a1,$a1,1		#tang a1 len 1 don vi

	bne $a0,$0,convert 	#neu $a0 != 0
	la $v0,($a1)		#gan $v0=giá tr? $a1
	jr $ra

toString:
	addi $sp,$0,-20		#tao stack gom 5 phan tu
	sw $ra,16($sp)		#sp[4] = $ra
	sw $a3,12($sp)		#sp[3] = $a3
	sw $a2,8($sp)		#sp[2] = $a2
	sw $a1,4($sp)		#sp[1] = $a1
	sw $a0,0($sp)		#sp[0[ = $a0
	
	lw  $a0,12($sp)		# $a0 = sp[3]
	add $a0,$a0,$0		
	lw $a1,0($sp)		# $a1 = sp[0]
	jal connectString
	add $a0,$0,$v0		# $a0 = $v0 // chen a1 vao a0 // chen ngay vao a0



	add $t1,$0,47		# chen dau '/' vao a0
	sb $t1($a0)
	addi $a0,$a0,1

	

	lw $a1,4($sp)		# a1 = sp[1]
	jal connectString
	add $a0,$0,$v0		# chen a1 vao a0 // chen thang vao a0


	add $t1,$0,47		# chen dau '/' vao a0
	sb $t1($a0)
	addi $a0,$a0,1



	lw $a1,8($sp)		# a1 = sp[2]
	jal connectString
	add $a0,$0,$v0		#chen a1 vao a0 // chen nam vao a0


	add $v0,$0,$a0		# $v0 = $a0 tra gai tri ve
	
	lw $ra,16($sp)		# doc dia chi tra ve $ra = sp[4]
	jr $ra			# nhay den dia chi $ra


toStringVer2:
	addi $sp,$0,-20		#tao stack gom 5 phan tu
	sw $ra,16($sp)		#sp[4] = $ra
	sw $a3,12($sp)		#sp[3] = $a3
	sw $a2,8($sp)		#sp[2] = $a2
	sw $a1,4($sp)		#sp[1] = $a1
	sw $a0,0($sp)		#sp[0[ = $a0
	
	lw  $a0,12($sp)		# $a0 = sp[3]
	add $a0,$a0,$0		
	lw $a1,0($sp)		# $a1 = sp[0]
	jal connectString
	add $a0,$0,$v0		# $a0 = $v0 // chen a1 vao a0 // chen ngay vao a0



	add $t1,$0,32		# chen dau ' ' vao a0
	sb $t1($a0)
	addi $a0,$a0,1

	

	lw $a1,4($sp)		# a1 = sp[1]
	jal connectString
	add $a0,$0,$v0		# chen a1 vao a0 // chen thang vao a0


	add $t1,$0,44		# chen dau ',' vao a0
	sb $t1($a0)
	addi $a0,$a0,1

	add $t1,$0,32		# chen dau ' ' vao a0
	sb $t1($a0)
	addi $a0,$a0,1

	lw $a1,8($sp)		# a1 = sp[2]
	jal connectString
	add $a0,$0,$v0		#chen a1 vao a0 // chen nam vao a0


	add $v0,$0,$a0		# $v0 = $a0 tra gai tri ve
	
	lw $ra,16($sp)		# doc dia chi tra ve $ra = sp[4]
	jr $ra			# nhay den dia chi $ra

printMonth:			#xet dieu kien de in ra thang
	addi $t0, $0, 1
	beq $t0, $a0, print1
	
	addi $t0, $0, 2
	beq $t0, $a0, print2
	
	addi $t0, $0, 3
	beq $t0, $a0, print3
	
	addi $t0, $0, 4
	beq $t0, $a0, print4
	
	addi $t0, $0, 5
	beq $t0, $a0, print5
	
	addi $t0, $0, 6
	beq $t0, $a0, print6
	
	addi $t0, $0, 7
	beq $t0, $a0, print7
	
	addi $t0, $0, 8
	beq $t0, $a0, print8
	
	addi $t0, $0, 9
	beq $t0, $a0, print9
	
	addi $t0, $0, 10
	beq $t0, $a0, print10
	
	addi $t0, $0, 11
	beq $t0, $a0, print11
	
	addi $t0, $0, 12
	beq $t0, $a0, print12
print1:				#cac dieu kien tra ve gia tri thang tuong ung
	la $v0, jan
	jr $ra
print2:
	la $v0, feb
	jr $ra
print3:
	la $v0, march
	jr $ra
print4:
	la $v0, apr
	jr $ra
print5:
	la $v0, may
	jr $ra
print6:
	la $v0, jun
	jr $ra
print7:
	la $v0, jul
	jr $ra
print8:
	la $v0, aug
	jr $ra
print9:
	la $v0, sep
	jr $ra
print10:
	la $v0, oct
	jr $ra
print11:
	la $v0, nov
	jr $ra
print12:
	la $v0, dec
	jr $ra

connectString:
	lb $t0,($a1)		# doc 1 byte cua $a1 dang tro den
	beqz $t0,quitString	# neu byte do bi trong thi ve ham truoc do
	sb $t0,($a0)		# ghi bai vua doc vao $a0
	addi $a1,$a1,1		# tang con tro cua $a1 len 1
	addi $a0,$a0,1		# tang con tro cua $a0 len 1
	add $v0,$0,$a0		# gan gia tri tra ve $v0 = $ a0
	j connectString		# gep chuoi tiep

quitString: 
	jr $ra

toInt:
	lb $t0,($a0)		# doc 1 byte cua $a1 dang tro den
	beqz $t0,quit		# neu byte do bi trong thi ve ham truoc do
	subi $t0,$t0,48		# chuyen byte vua doc tu kieu ky tu sang kieu so
	mult $a1,$a2		# nhan $a1 cho 10 ($a2 = 10)
	mflo $a1		# luu tich lai vao $a1
	add $a1,$a1,$t0		# cong gia tri vua chuyen sang so vao $a1
	addi $a0,$a0,1		# tang con tro cua $a0 len 1
	add $v0,$a1,$0		# gan gia tri tra ve $v0 = $a1
	j toInt			# chuyen chuoi sang so tiep

countString:
	lb $t0,($a0)
	beqz $t0,quit
	addi $a1,$a1,1
	addi $a0,$a0,1
	add $v0,$a0,$0
	j countString
result:
	la $a0, namNhuan
	addi $v0, $0, 4
	syscall
	addi $v0, $0, 1
	
	j exit
result2:
	addi $t1, $0, 100
	div $t0, $t1
	mfhi $t2
	beq $t2, $0, return
	j result
synMonth:				#so sanh thang de dua ve so tuong ung
	addi $t0, $0, 1
	beq $t0, $a0, synMonth1
	
	addi $t0, $0, 2
	beq $t0, $a0, synMonth2
	
	addi $t0, $0, 3
	beq $t0, $a0, synMonth3
	
	addi $t0, $0, 4
	beq $t0, $a0, synMonth4
	
	addi $t0, $0, 5
	beq $t0, $a0, synMonth5
	
	addi $t0, $0, 6
	beq $t0, $a0, synMonth6
	
	addi $t0, $0, 7
	beq $t0, $a0, synMonth7
	
	addi $t0, $0, 8
	beq $t0, $a0, synMonth8
	
	addi $t0, $0, 9
	beq $t0, $a0, synMonth9
	
	addi $t0, $0, 10
	beq $t0, $a0, synMonth10
	
	addi $t0, $0, 11
	beq $t0, $a0, synMonth11
	
	addi $t0, $0, 12
	beq $t0, $a0, synMonth12
synMonth1:
	addi $v0, $0, 0
	jr $ra
synMonth2:
	addi $v0, $0, 3
	jr $ra
synMonth3:
	addi $v0, $0, 3
	jr $ra
synMonth4:
	addi $v0, $0, 6
	jr $ra
synMonth5:
	addi $v0, $0, 1
	jr $ra
synMonth6:
	addi $v0, $0, 4
	jr $ra
synMonth7:
	addi $v0, $0, 6
	jr $ra
synMonth8:
	addi $v0, $0, 2
	jr $ra
synMonth9:
	addi $v0, $0, 5
	jr $ra
synMonth10:
	addi $v0, $0, 0
	jr $ra
synMonth11:
	addi $v0, $0, 3
	jr $ra
synMonth12:
	addi $v0, $0, 5
	jr $ra
printDay:
	addi $t0, $0, 0
	beq $t0, $a0, printSun
	
	addi $t0, $0, 1
	beq $t0, $a0, printMon
	
	addi $t0, $0, 2
	beq $t0, $a0, printTue
	
	addi $t0, $0, 3
	beq $t0, $a0, printWed
	
	addi $t0, $0, 4
	beq $t0, $a0, printThu
	
	addi $t0, $0, 5
	beq $t0, $a0, printFri
	
	addi $t0, $0, 6
	beq $t0, $a0, printSat
printSun:
	la $a0, sun
	addi $v0, $0, 4
	syscall
	
	jr $ra
printMon:
	la $a0, mon
	addi $v0, $0, 4
	syscall
	
	jr $ra
printTue:
	la $a0, tue
	addi $v0, $0, 4
	syscall
	
	jr $ra
printWed:
	la $a0, wed
	addi $v0, $0, 4
	syscall
	
	jr $ra
printThu:
	la $a0, thu
	addi $v0, $0, 4
	syscall
	
	jr $ra
printFri:
	la $a0, fri
	addi $v0, $0, 4
	syscall
	
	jr $ra
printSat:
	la $a0, sat
	addi $v0, $0, 4
	syscall
	
	jr $ra
synCentury:				#so sanh the ky de chuan hoa
	addi $t0, $0, 0
	beq $t0, $a1, century1
	
	addi $t0, $0, 1
	beq $t0, $a1, century2
	
	addi $t0, $0, 2
	beq $t0, $a1, century3
	
	addi $t0, $0, 3
	beq $t0, $a1, century4
century1:
	addi $v0, $0, 6
	jr $ra
century2:
	addi $v0, $0, 4
	jr $ra
century3:
	addi $v0, $0, 2
	jr $ra
century4:
	addi $v0, $0, 0
	jr $ra
tinhKhoangCach:
	sub $t0, $s5, $s2
	
	addi $v0, $0, 4
	la $a0, inKhoangCach
	syscall
	
	add $a0, $0, $t0
	addi $v0, $0, 1
	syscall
	
	addi $v0, $0, 4
	la $a0, nam
	syscall
	
	j exit

KiemTraNamNhuan:
	addi $sp,$0,-8
	sw $ra,4($sp)
	sw $a0,0($sp)


	lw $t0,0($sp)
	
	
	addi $t1, $0, 400
	div $t0, $t1
	mfhi $t2

	lw $a0,4($sp)
	beq $t2, $0, rep1

	addi $t1, $0, 4
	div $t0, $t1
	mfhi $t2
	beq $t2, $0, rep2

	addi $v0, $0, 0
	lw $ra,4($sp)
	jr $ra

rep1:
	addi $v0, $0, 1
	jr $a0

rep2:
	addi $t1, $0, 100
	div $t0, $t1
	mfhi $t2
	beq $t2, $0, rep3
	j rep1

rep3:
	addi $v0,$0,0
	jr $a0

quit:
	jr $ra

exit:
	addi $v0,$0,10
	syscall
