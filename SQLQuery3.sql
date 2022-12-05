
--select all the data
Select *
from PortfolioProject..Worksheet$
order by 1,2

-- Basic Data Exploration 

select count (*) from PortfolioProject..Worksheet$

select distinct [Type de document] from PortfolioProject..Worksheet$


select count(distinct [Type de document]) from PortfolioProject..Worksheet$

select distinct Auteur from PortfolioProject..Worksheet$

select count(distinct Auteur) from PortfolioProject..Worksheet$

select  count(distinct[Nombre d'exemplaires]) from PortfolioProject..Worksheet$

select [Type de document], Pr�ts,  [Nombre de pr�ts 2017], [Nombre de localisations] from PortfolioProject..Worksheet$  order by [Nombre de localisations]

select SUM([Nombre de pr�t total]) as NombrePretLivreTotal  from PortfolioProject..Worksheet$

select AVG([Nombre de pr�t total]) as MoyennePretLivre  from PortfolioProject..Worksheet$

select  ([Nombre de pr�t total]) as NombrePretLivreTotal  from PortfolioProject..Worksheet$

select [Type de document], Titre, Pr�ts, [Nombre de pr�ts 2017],[Nombre de pr�t total]
from PortfolioProject..Worksheet$ 
where [Type de document] like '%Livre jeunesse%'
order by [Nombre de pr�t total],Pr�ts,[Nombre de pr�ts 2017]

--select data that we are going to be using 

---  Pourcentage de pret de l'annee 2017 
Select  [Type de document] ,[Nombre de pr�t total], 
[Nombre de pr�ts 2017] ,([Nombre de pr�ts 2017]/[Nombre de pr�t total])*100 as PourcentageDePret17
From PortfolioProject..Worksheet$
where [Type de document] like '%Livre jeunesse%'
order by PourcentageDePret17

Select  [Type de document] ,[Nombre de pr�t total], 
[Nombre de pr�ts 2017] ,([Nombre de pr�ts 2017]/[Nombre de pr�t total])*100 as PourcentageDePret17
From PortfolioProject..Worksheet$
where [Type de document] like '%Bande dessin�e jeunesse%'
order by PourcentageDePret17

Select  [Type de document] ,[Nombre de pr�t total], 
[Nombre de pr�ts 2017] ,([Nombre de pr�ts 2017]/[Nombre de pr�t total])*100 as PourcentageDePret17
From PortfolioProject..Worksheet$
where [Type de document] like '%DVD jeunesse%'
order by PourcentageDePret17

Select  [Type de document] ,[Nombre de pr�t total], 
[Nombre de pr�ts 2017] ,([Nombre de pr�ts 2017]/[Nombre de pr�t total])*100 as PourcentageDePret17
From PortfolioProject..Worksheet$
where [Type de document] like '%Jeux de soci�t�%'
order by PourcentageDePret17

--- Pourcentage de pret de l'annee t 

Select  [Type de document] ,Pr�ts,[Nombre de pr�t total]
 ,(Pr�ts/[Nombre de pr�t total])*100 as PourcentageDePret
From PortfolioProject..Worksheet$
where [Type de document] like '%Livre jeunesse%'
order by PourcentageDePret

--select type de document le plus pretee


Select   [Type de document] ,MAX([Nombre de pr�t total]) as TypePlusPretee 
From PortfolioProject..Worksheet$
group by [Type de document]

--select 

select [Type de document], [Titre],[Nombre de pr�t total], MAX([Pr�ts]) as MaximumdePret, MAX(([Pr�ts]/[Nombre de pr�t total]))*100 as PourcentageLivrePrete
from PortfolioProject..Worksheet$
group by [Type de document],[Titre],[Nombre de pr�t total]
order by PourcentageLivrePrete desc




-- Global Numbers

select SUM(cast([Type de document] as int)) as TotalDocument, SUM(cast([Titre] as int)) as TotalTitre ,
SUM(cast([Titre] as int))/SUM(cast([Type de document] as int)) as Pourcentage
from PortfolioProject..Worksheet$
order by 1,2

--
--- create view to store data for later visualisations 
Create View Nomview1 as 
select [Type de document], [Titre],[Nombre de pr�t total], MAX([Pr�ts]) as MaximumdePret, MAX(([Pr�ts]/[Nombre de pr�t total]))*100 as PourcentageLivrePrete
from PortfolioProject..Worksheet$
group by [Type de document],[Titre],[Nombre de pr�t total]

select * from Nomview1