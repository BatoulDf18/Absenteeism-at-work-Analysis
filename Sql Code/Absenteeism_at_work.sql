--create a join table 
select * from Absenteeism_at_work a 
left join compensation b
on a.id=b.id
left join Reasons  r on
a.Reason_for_absence=r.Number;
 
--- find the healthiest---
select * from Absenteeism_at_work
where Social_drinker=0 and Social_smoker=0
and Body_mass_index<25 and
Absenteeism_time_in_hours < (select Avg(Absenteeism_time_in_hours) from Absenteeism_at_work)

---compensation rate increase for non-smokers  / budjet $983,221 /$0.68 increase per hour
select count(*) as nonsmokers from Absenteeism_at_work
where Social_smoker=0

--optimize this query--
select 
a.id, 
r.Reason,
a.Month_of_absence,
a.Body_mass_index,
case when a.Body_mass_index <18.5 then 'Underweight'
     when a.Body_mass_index between 18.5 and 25 then 'Healthy Weight'
	 when a.Body_mass_index Between 25 and 30 then 'Overweight'
	 when a.Body_mass_index >30 then 'Obese'
	 else 'Unknown' End as BMI_Category,
case when a.Month_of_absence in (3,4,5) then 'Spring'
	 when a.Month_of_absence in (6,7,8) then 'Summer'
     when a.Month_of_absence in (9,10,11) then 'Fall'
	 when a.Month_of_absence in (12,1,2) then 'Winter'
	 else 'Unknown' End as Season_names,
a.Month_of_absence,
a.Day_of_the_week,
a.Transportation_expense,
a.Education,
a.Son,
a.Social_drinker,
a.Pet,
a.Disciplinary_failure,
a.Age,
a.Work_load_Average_day,
a.Absenteeism_time_in_hours
from Absenteeism_at_work a 
left join compensation b
on a.id=b.id
left join Reasons  r on
a.Reason_for_absence=r.Number;