library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_Unit is
    Port ( counter_hit : in  STD_LOGIC;			-- valore del contatore
			  sel_q0	: out std_logic;			-- segnale di selezione del multiplexer: se 0, Q[0] = X(0), se 1, Q[0] = not A(N-1)
           count_in : out  STD_LOGIC;
           S : in  STD_LOGIC;					-- Risultato confronto/sottrazione ( 0 => 2R > V , 1=> 2R < V ) "segno di A"
           subtract : out  STD_LOGIC;		-- decide se l'addizionatore deve effettuare somma o sottrazione
           reset_n : in  STD_LOGIC;	
           en_a : out  STD_LOGIC;
           en_q : out  STD_LOGIC;
			  en_q0	: out std_logic;
			  reset_a_n : out std_logic;		
			  shift	: out std_logic;	
           start_division : in  STD_LOGIC;	-- segnale di start della divisione
			  stop_division: out STD_LOGIC;		-- segnale di stop della divisione
           clock : in  STD_LOGIC;
           reset_counter_n : out  STD_LOGIC);
end Control_Unit;

architecture Behavioral of Control_Unit is

	type state_type is (Idle,Init,lshift,sumSub,set_q0,endsum);
	signal current_state: state_type:=Idle;	-- si inizia da idle
	
	
begin

	fsm: process(clock,reset_n)
	begin
	
	if reset_n<='0' then
		current_state<=Idle;
		
	elsif rising_edge(clock) then
		en_a<='0';
		en_q<='0';
		en_q0<='0';
		stop_division<='0';
		reset_counter_n<='1';
		reset_a_n<='1';
		count_in<='0';
		shift<='0';
		sel_q0<='1';
	
		case current_state is
			when idle=>
			    stop_division <= '1';	-- stop alto quando si ferma	
				if start_division='1' then
					current_state<=Init;		-- passo a init per iniziare con start=1
				else
					current_state<=Idle;		-- altrimenti resto in idle
				end if;
				
			when Init=>			-- inizializzazione registri
				en_a<='1';
				en_q<='1';
				en_q0<='1';
				sel_q0<='0';				-- il multiplexer seleziona il negato di A[N-1] invece che X(0) (scelta in base al segno della differenza)
				reset_counter_n<='0';
				reset_a_n<='0';
				current_state<=lshift;	
				
			when lshift=>		-- effettuo shift dei registri a e q		
				en_a<='1';
				en_q<='1';
				shift<='1';		-- sarebbe scan_en di A e Q
				current_state<=sumSub;

			when sumSub=>
				en_a<='1';
				if S='1' then --scelgo l'operazione in base al segno di A (S)	
					subtract<='0';	-- effettuo la somma
					current_state<=set_q0;
				else 
					subtract<='1';	-- effetto la sottrazione
					current_state<=set_q0;
				end if;
				
			when set_q0=>			-- faccio uno stato a parte per aspettare che termini la sottrazione al colpo di clock successivo
					en_q0<='1';		-- Q0 sarà il negato del segno di A(S) poiché abbiamo messo sel_q0=1
					if counter_hit='1' then	-- controllo se ho terminato
						current_state<=endsum;	-- scelgo se fare l'ultima somma
					else 
						count_in<='1';
						current_state<=lshift;		-- o continuare con la divisione		
					end if;
					
			when endsum=>
				if S='1' then 	-- devo fare la somma finale se S=1
					en_a<='1';
					subtract<='0';
					current_state<=Idle;
				else
					current_state<=Idle; -- altrimenti torno in idle
				end if;
		end case;
	
	end if;
	
	end process;

end Behavioral;

