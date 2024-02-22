;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	dimasgodim.com. root.dimasgodim.com. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	dimasgodim.com.

; A Record Kita
@	IN	A	10.10.10.69
www.dimasgodim.com.	IN	CNAME	dimasgodim.com.
