/*

LSA FY2021 Sample Code

Name:  08 LSACalculated Averages.sql  
Date:  26 AUG 2021   
	
Uses static reference tables:
	ref_RowValues - Required Cohort, Universe, SystemPath values for each RowID
	ref_RowPopulations - Required Populations for each RowID 
					and (for rows 1-9) whether the RowID is required by SystemPath for the Population
	ref_PopHHTypes -  HHTypes required in LSACalculated for each Population by PopID

Populates and references:
	tlsa_Pops - By PopID -- HoHID, HHType, and Cohort for each population member


	8.3 Populations for Average Days from LSAHousehold and LSAExit
*/
-- 

	delete from tlsa_Pops

	insert into tlsa_Pops (PopID, Step)
	values (0, '8.3.1')

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 10, 1, hh.HoHID, hh.HHType, '8.3.2'
	from tlsa_Household hh where hh.HHAdultAge = 18 and hh.HHType = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 11, 1, hh.HoHID, hh.HHType, '8.3.3'
	from tlsa_Household hh where hh.HHAdultAge = 24 and hh.HHType = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 12, 1, hh.HoHID, hh.HHType, '8.3.4'
	from tlsa_Household hh where hh.HHType = 2 and hh.HHParent = 1 and HHAdultAge in (18,24)

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 13, 1, hh.HoHID, hh.HHType, '8.3.5'
	from tlsa_Household hh where hh.HHVet = 1 

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 14, 1, hh.HoHID, hh.HHType, '8.3.6'
	from tlsa_Household hh where hh.HHVet = 0 and hh.HHAdultAge in (25, 55) and hh.HHType = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 15, 1, hh.HoHID, hh.HHType, '8.3.7'
	from tlsa_Household hh where hh.HHChronic = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 16, 1, hh.HoHID, hh.HHType, '8.3.8'
	from tlsa_Household hh where hh.HHChronic in (1,2)

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 17, 1, hh.HoHID, hh.HHType, '8.3.9'
	from tlsa_Household hh where hh.HHChronic in (0,3)

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 18, 1, hh.HoHID, hh.HHType, '8.3.10'
	from tlsa_Household hh where hh.HHDisability = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 19, 1, hh.HoHID, hh.HHType, '8.3.11'
	from tlsa_Household hh where hh.HHFleeingDV = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 20, 1, hh.HoHID, hh.HHType, '8.3.12'
	from tlsa_Household hh where hh.Stat = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 21, 1, hh.HoHID, hh.HHType, '8.3.13'
	from tlsa_Household hh where hh.Stat = 2

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 22, 1, hh.HoHID, hh.HHType, '8.3.14'
	from tlsa_Household hh where hh.PSHMoveIn = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select case when hh.HoHRace = 5 and hh.HoHEthnicity <> 1 then 23
			when hh.HoHRace = 5 and hh.HoHEthnicity = 1 then 24
			when hh.HoHRace = 3 and hh.HoHEthnicity <> 1 then 25
			when hh.HoHRace = 3 and hh.HoHEthnicity = 1 then 26
			when hh.HoHRace = 2 then 27
			when hh.HoHRace = 1 and hh.HoHEthnicity <> 1 then 28
			when hh.HoHRace = 1 and hh.HoHEthnicity = 1 then 29
			when hh.HoHRace = 4 then 30
			else 31 end
		, 1, hh.HoHID, hh.HHType, '8.3.15'
	from tlsa_Household hh where hh.HoHRace not in (8,9,99)

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 32, 1, hh.HoHID, hh.HHType, '8.3.16'
	from tlsa_Household hh where hh.HoHEthnicity = 0

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 33, 1, hh.HoHID, hh.HHType, '8.3.17'
	from tlsa_Household hh where hh.HoHEthnicity = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 34, 1, hh.HoHID, hh.HHType, '8.3.18'
	from tlsa_Household hh where hh.HHAdultAge = 55 and hh.HHType = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 35, 1, hh.HoHID, hh.HHType, '8.3.19'
	from tlsa_Household hh where hh.HHParent = 1 and hh.HHType = 3

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 36, 1, hh.HoHID, hh.HHType, '8.3.20'
	from tlsa_Household hh where hh.HHChild = 3 and hh.HHType = 2

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 10, ex.Cohort, ex.HoHID, ex.HHType, '8.3.21'
	from tlsa_Exit ex
	where ex.HHAdultAge = 18 and ex.HHType = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 11, ex.Cohort, ex.HoHID, ex.HHType, '8.3.22'
	from tlsa_Exit ex
	where ex.HHAdultAge = 24 and ex.HHType = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 12, ex.Cohort, ex.HoHID, ex.HHType, '8.3.23'
	from tlsa_Exit ex
	where ex.HHType = 2 and ex.HHParent = 1 and HHAdultAge in (18,24)

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 13, ex.Cohort, ex.HoHID, ex.HHType, '8.3.24'
	from tlsa_Exit ex
	where ex.HHVet = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 14, ex.Cohort, ex.HoHID, ex.HHType, '8.3.25'
	from tlsa_Exit ex
	where ex.HHVet = 0 and ex.HHAdultAge in (25, 55) and ex.HHType = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 15, ex.Cohort, ex.HoHID, ex.HHType, '8.3.26'
	from tlsa_Exit ex
	where ex.HHChronic = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 16, ex.Cohort, ex.HoHID, ex.HHType, '8.3.27'
	from tlsa_Exit ex
	where ex.HHChronic in (1,2)

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 17, ex.Cohort, ex.HoHID, ex.HHType, '8.3.28'
	from tlsa_Exit ex
	where ex.HHChronic in (0,3)

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 18, ex.Cohort, ex.HoHID, ex.HHType, '8.3.29'
	from tlsa_Exit ex
	where ex.HHDisability = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 19, ex.Cohort, ex.HoHID, ex.HHType, '8.3.30'
	from tlsa_Exit ex
	where ex.HHFleeingDV = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 20, ex.Cohort, ex.HoHID, ex.HHType, '8.3.31'
	from tlsa_Exit ex
	where ex.Stat = 1

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 21, ex.Cohort, ex.HoHID, ex.HHType, '8.3.32'
	from tlsa_Exit ex
	where ex.Stat = 2

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select case when ex.HoHRace = 5 and ex.HoHEthnicity <> 1 then 23
			when ex.HoHRace = 5 and ex.HoHEthnicity = 1 then 24
			when ex.HoHRace = 3 and ex.HoHEthnicity <> 1 then 25
			when ex.HoHRace = 3 and ex.HoHEthnicity = 1 then 26
			when ex.HoHRace = 2 then 27
			when ex.HoHRace = 1 and ex.HoHEthnicity <> 1 then 28
			when ex.HoHRace = 1 and ex.HoHEthnicity = 1 then 29
			when ex.HoHRace = 4 then 30
			else 31 end
		, ex.Cohort, ex.HoHID, ex.HHType, '8.3.33'
	from tlsa_Exit ex
	where ex.HoHRace not in (8,9,99)

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select case when ex.HoHEthnicity = 0 then 32
			else 33 end
		, ex.Cohort, ex.HoHID, ex.HHType, '8.3.34'
	from tlsa_Exit ex
	where ex.HoHEthnicity in (1,0)

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 34, ex.Cohort, ex.HoHID, ex.HHType, '8.3.35'
	from tlsa_Exit ex
	where ex.HHAdultAge = 55 and ex.HHType = 1 

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 35, ex.Cohort, ex.HoHID, ex.HHType, '8.3.36'
	from tlsa_Exit ex
	where ex.HHParent = 1 and ex.HHType = 3

	insert into tlsa_Pops (PopID, Cohort, HoHID, HHType, Step)
	select 36, ex.Cohort, ex.HoHID, ex.HHType, '8.3.37'
	from tlsa_Exit ex
	where ex.AC3Plus = 1 and ex.HHType = 2

/*
	8.4-8.7 Average Days from LSAHousehold 
 */
	delete from lsa_Calculated

	insert into lsa_Calculated (Value, Cohort, Universe, HHType
		, Population, SystemPath, ReportRow, ReportID, Step)
	select case rv.RowID 
		when 1 then avg(hh.ESDays)
		when 2 then avg(hh.THDays)
		when 3 then avg(hh.ESTDays)
		when 4 then avg(hh.RRHPSHPreMoveInDays) 
		when 5 then avg(hh.SystemHomelessDays)
		when 6 then avg(hh.Other3917Days)
		when 7 then avg(hh.TotalHomelessDays)
		when 8 then avg(hh.RRHHousedDays)
		when 9 then avg(hh.SystemDaysNotPSHHoused)
		when 10 then avg(hh.PSHHousedDays)
		when 11 then avg(hh.PSHHousedDays)
		when 12 then avg(hh.RRHPreMoveInDays)
		when 13 then avg(hh.RRHPreMoveInDays)
		when 14 then avg(hh.RRHPreMoveInDays)
		when 15 then avg(hh.RRHHousedDays)
		else avg(hh.RRHHousedDays) end,
		rv.Cohort, rv.Universe, ph.HHType,
		rp.PopID, rv.SystemPath, rv.RowID, 
		hh.ReportID, '8.4-8.7'
	from tlsa_household hh 
	inner join tlsa_Pops pop1 on (pop1.PopID = 0 or (pop1.HHType = hh.HHType and pop1.HoHID = hh.HoHID)) and pop1.Cohort = 1
	inner join tlsa_Pops pop2 on (pop2.PopID = 0 or (pop2.HHType = hh.HHType and pop2.HoHID = hh.HoHID)) and pop1.Cohort = 1
	inner join ref_RowPopulations rp on rp.Pop1 = pop1.PopID and rp.Pop2 = pop2.PopID 
	inner join ref_PopHHTypes ph on ph.PopID = rp.PopID and (ph.HHType = hh.HHType or ph.HHType = 0)
	inner join ref_RowValues rv on rv.RowID between rp.RowMin and rp.RowMax 
			and (rp.ByPath is null or rv.SystemPath = hh.SystemPath)
	where rv.RowID between 1 and 16
		and case rv.RowID 
				when 1 then hh.ESDays
				when 2 then hh.THDays
				when 3 then hh.ESTDays
				when 4 then hh.RRHPSHPreMoveInDays 
				when 5 then hh.SystemHomelessDays
				when 6 then hh.Other3917Days
				when 7 then hh.TotalHomelessDays
				when 8 then hh.RRHHousedDays
				when 9 then hh.SystemDaysNotPSHHoused
				when 10 then hh.PSHHousedDays
				when 11 then hh.PSHHousedDays
				when 12 then hh.RRHPreMoveInDays
				when 13 then hh.RRHPreMoveInDays
				when 14 then hh.RRHPreMoveInDays
				when 15 then hh.RRHHousedDays
			else hh.RRHHousedDays end > 0
		and (rv.RowID <> 10 or (hh.PSHMoveIn in (1,2) and hh.PSHStatus in (12,22)))
		and (rv.RowID <> 11 or (hh.PSHMoveIn in (1,2) and hh.PSHStatus in (11,21)))
		and (rv.RowID <> 12 or (hh.RRHStatus in (12,22) and hh.RRHMoveIn = 0))
		and (rv.RowID <> 13 or (hh.RRHStatus in (11,21) and hh.RRHMoveIn = 0))
		and (rv.RowID <> 14 or (hh.RRHStatus > 2 and hh.RRHMoveIn in (1,2)))
		and (rv.RowID <> 15 or (hh.RRHStatus in (12,22) and hh.RRHMoveIn in (1,2)))
		and (rv.RowID <> 16 or (hh.RRHStatus in (11,21) and hh.RRHMoveIn in (1,2)))
	group by rv.RowID, rv.Cohort, rv.Universe, ph.HHType,
		rp.PopID, rv.SystemPath, rv.RowID, 
		hh.ReportID

/*
	8.8-8.11 Average Days from LSAExit 
*/
	insert into lsa_Calculated (Value, Cohort, Universe, HHType
		, Population, SystemPath, ReportRow, ReportID, Step)
	select avg(ex.ReturnTime),
		rv.Cohort, rv.Universe, ex.HHType,
		rp.PopID, rv.SystemPath, rv.RowID, 
		ex.ReportID, '8.8-8.11'
	from tlsa_Exit ex 
	inner join tlsa_Pops pop1 on (pop1.PopID = 0 or (pop1.HHType = ex.HHType and pop1.HoHID = ex.HoHID and pop1.Cohort = ex.Cohort)) 
	inner join tlsa_Pops pop2 on (pop2.PopID = 0 or (pop2.HHType = ex.HHType and pop2.HoHID = ex.HoHID and pop2.Cohort = ex.Cohort)) 
	inner join ref_RowPopulations rp on rp.Pop1 = pop1.PopID and rp.Pop2 = pop2.PopID 
	inner join ref_PopHHTypes ph on ph.PopID = rp.PopID and ph.HHType = 0 or ph.HHType = ex.HHType
	inner join ref_RowValues rv on rv.RowID between rp.RowMin and rp.RowMax 
			and (rv.SystemPath = -1 or rv.SystemPath = ex.SystemPath)
			and rv.Cohort = ex.Cohort 
			and rv.Universe = case 
				when ex.ExitTo between 1 and 6 then 2
				when ex.ExitTo between 7 and 14 then 3
				else 4 end
	where (rv.RowID between 18 and 52 or rv.RowID in (63,64)) 
		and ex.ReturnTime > 0
		and (rv.RowID not between 18 and 22 or ex.ExitFrom = (rv.RowID - 16))
		and (rv.RowID <> 63 or ex.ExitFrom = 7)
		and (rv.RowID <> 64 or ex.ExitFrom = 8)
		and (rv.RowID <> 36 or ex.SystemPath <> -1)
		and (rv.RowID not between 37 and 51 or ex.ExitTo = (rv.RowID - 36))
		and (rv.RowID <> 52 or ex.ExitTo = 99)
	group by rv.RowID, rv.Cohort, rv.Universe, ex.HHType,
		rp.PopID, rv.SystemPath, rv.RowID, 
		ex.ReportID