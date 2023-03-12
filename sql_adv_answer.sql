file:///C:/Users/kousu/AppData/Local/Temp/Temp2_02_DB%E5%9F%BA%E7%A4%8E.zip/02_DB%E8%9D%93%EF%BD%BA%E9%81%89%E3%83%BB02_db_advanced/SQL%E9%82%B1%EF%BD%B4%E9%84%99%E8%B2%9E%E6%92%AB%E9%AC%98%E5%A5%91%E8%A0%A2%E6%87%83%E7%95%91.pdf

問1
各グループの中でFIFAランクが最も⾼い国と低い国のランキング番号を表⽰してください。
SQL実⾏結果

/*
select group_name,
min(ranking),
max(ranking)
from countries
group by group_name;

select カラム名,
min(カラム名),
max(カラム名)
from テーブル名
group by カラム名;
*/

group_name	min(ranking)	max(ranking)
A	3	56
B	1	62
C	8	46
D	7	28
E	6	33
F	5	44
G	2	37
H	11	57



ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問2
全ゴールキーパーの平均⾝⻑、平均体重を表⽰してください。
SQL実⾏結果

/*
SELECT
avg(height),
avg(weight)
FROM players
WHERE position = 'GK';

SELECT
avg(カラム名),
avg(カラム名)
FROM テーブル名
WHERE カラム名 = 'カラム名詳細';
*/

187.6250	82.8854


ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問3
各国の平均⾝⻑を⾼い⽅から順に表⽰してください。
ただし、FROM句はcountriesテーブルとしてください。

/**
昇順ならASC、降順ならDESC .
デフォルトでは昇順となっているのでASCは省略可能
SELECT カラム名
FROM テーブル名
ORDER BY ソートするカラム名 ASCもしくはDESC;

SELECT countries.name,avg(height)
FROM countries
INNER JOIN players
on countries.id = players.country_id
group by countries.id, countries.name
order by avg(height) DESC;

SELECT テーブル名１.カラム名,カラム名
FROM テーブル名
INNER JOIN テーブル名２
on テーブル名.カラム名 = テーブル名２.カラム名
group by テーブル名.カラム名, テーブル名.カラム名
order by avg(カラム名) DESC;

*/
name	avg(height)   	
ドイツ	185.7391	
ベルギー	185.1739	
ボスニア・ヘルツェゴビナ	184.9130	
ギリシャ	184.6087	
韓国	183.8261	
クロアチア	183.8261	
イングランド	183.6087	
米国	183.2174	
アルジェリア	183.1739	
ナイジェリア	183.0870	
スイス	182.8696	
イタリア	182.8261	
イラン	182.4348	
ロシア	181.8261	
ポルトガル	181.7826	
オーストラリア	181.6522	
アルゼンチン	181.6087	
カメルーン	181.3478	
ブラジル	181.3043	
コートジボワール	181.2609	
ウルグアイ	181.0870	
フランス	181.0870	
コロンビア	181.0435	
オランダ	181.0435	
スペイン	180.0870	
ガーナ	180.0435	
ホンジュラス	179.8261	
コスタリカ	179.8261	
エクアドル	178.8261	
日本	178.5217	
メキシコ	177.5217	
チリ	176.2174	



ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問4
各国の平均⾝⻑を⾼い⽅から順に表⽰してください。
ただし、FROM句はplayersテーブルとして、テーブル結合を使わず副問合せを⽤いてください。
SQL実⾏結果
/** サブクエリ（副問合せ）とは,主にFROM句,WHERE句,SELECT句で記述する場合が多い */
/**
select (select c.name from countries c where p.country_id = c.id)
as '国名', avg(height)
as '平均身長'
from players p group by p.country_id
order by avg(p.height) desc;

select (select c.カラム名 from テーブル名 c where p.country_id = c.id)
as 'カラム表示名', avg(カラム名)
as 'カラム表示名'
from テーブル名 p group by p.country_id
order by avg(p.カラム名) desc;

*/

////////////////////////////////////////////////////////////////
SELECT players.club,avg(height)   //playersテーブルのclubカラム、平均身長
FROM players                      //playersテーブル
WHERE players.height              //playersテーブルの身長カラム
group by players.country_id,name  //[ group by  ]  ➡  テーブル内の同じ内容を一つにまとめる（グループ化する。）
order by avg(height) DESC;        //order by DESCと記述すると、「降順（descending)にソート」という意味になります。

////////////////////////////////////////////////////////////////

SELECT players.club,avg(height)
FROM players
WHERE players.height
group by players.country_id,name
order by avg(height) DESC;

////////////////////////////////////////////////////////////////

select (select co.name from countries co where pl.country_id = co.id)
as 'チームの祖国', avg(height)
as '平均身長'
from players pl
group by pl.country_id
order by avg(pl.height) DESC;


チームの母国	平均身長	
ドイツ	185.7391	
ベルギー	185.1739	
ボスニア・ヘルツェゴビナ	184.9130	
ギリシャ	184.6087	
韓国	183.8261	
クロアチア	183.8261	
イングランド	183.6087	
米国	183.2174	
アルジェリア	183.1739	
ナイジェリア	183.0870	
スイス	182.8696	
イタリア	182.8261	
イラン	182.4348	
ロシア	181.8261	
ポルトガル	181.7826	
オーストラリア	181.6522	
アルゼンチン	181.6087	
カメルーン	181.3478	
ブラジル	181.3043	
コートジボワール	181.2609	
フランス	181.0870	
ウルグアイ	181.0870	
コロンビア	181.0435	
オランダ	181.0435	
スペイン	180.0870	



ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
★ここから
問5
キックオフ⽇時と対戦国の国名をキックオフ⽇時の早いものから順に表⽰してください。
SQL実⾏結果
/**
[ ASC ] ➡ 昇順(小さいもの順)
*/
/**
select kickoff,my_country.name,enemy_country.name
from pairings
join countries as my_country
  on pairings.my_country_id = my_country.id
join countries enemy_country
  on pairings.enemy_country_id = enemy_country.id
order by kickoff
;
*/
以下省略

SELECT *
FROM `pairings_tmp`
ORDER BY `pairings_tmp`.`enemy_country` ASC
ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問6
すべての選⼿を対象として選⼿ごとの得点ランキングを表⽰してください。
SELECT句で副問合せを使うこと
SQL実⾏結果

以下省略

SELECT p.name AS 名前, p.position AS ポジション, p.club AS 所属クラブ, 
    (SELECT COUNT(id) FROM goals g WHERE g.player_id = p.id) AS ゴール数
FROM players p
ORDER BY ゴール数 DESC


ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問7
すべての選⼿を対象として選⼿ごとの得点ランキングを表⽰してください。
テーブル結合を使うこと
SQL実⾏結果

以下省略

SELECT p.name AS 名前, p.position AS ポジション, p.club AS 所属クラブ, 
    COUNT(g.id) AS ゴール数
FROM players p
LEFT JOIN goals g ON g.player_id = p.id
GROUP BY p.id, p.name, p.position, p.club
ORDER BY ゴール数 DESC

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問8
各ポジションごとの総得点を表⽰してください。
SQL実⾏結果


SELECT p.position AS ポジション, COUNT(g.id) AS ゴール数
FROM players p
LEFT JOIN goals g ON g.player_id = p.id
GROUP BY p.position
ORDER BY ゴール数 DESC

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問9
ワールドカップ開催当時（2014-06-13）の年齢をプレイヤー毎に表⽰してください。
表⽰項⽬︓誕⽣⽇、年齢、名前、ポジション
表⽰順︓年齢の降順
SQL実⾏結果

以下省略

SELECT birth, TIMESTAMPDIFF(YEAR, birth, '2014-06-13') AS age, name, position
FROM players
ORDER BY age DESC;

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問10
オウンゴールの回数を表⽰してください。
オウンゴールはgoalsテーブルのplayer_id列がNULLのものになります。
SQL実⾏結果


SELECT COUNT(g.goal_time)
FROM goals  g
WHERE g.player_id IS NULL;
ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問11
各グループごとの総得点数を表⽰して下さい。
BETWEEN演算⼦を使⽤して下さい。
グループリーグの対戦は2014-6-13から2014-6-27までに⾏われていました。
SQL実⾏結果

SELECT c.group_name, COUNT(g.id)
FROM goals g
LEFT JOIN pairings p ON p.id = g.pairing_id
LEFT JOIN countries c ON p.my_country_id = c.id 
WHERE p.kickoff BETWEEN '2014-06-13 0:00:00' AND '2014-06-27 23:59:59'
GROUP BY c.group_name

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問12
⽇本VSコロンビア戦（pairings.id = 103）でのコロンビアの得点のゴール時間を表⽰してください。
SQL実⾏結果

SELECT goal_time
FROM goals
WHERE pairing_id = 103

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問13
⽇本VSコロンビア戦の勝敗を表⽰して下さい。
⽇本のゴール数はpairings.id = 39、コロンビアのゴール数はparings.id = 103です。
SQL実⾏結果

SELECT c.name, COUNT(g.goal_time)
FROM goals g
LEFT JOIN pairings p ON p.id = g.pairing_id
LEFT JOIN countries c ON p.my_country_id = c.id 
WHERE p.id = 103 OR p.id = 39
GROUP BY c.name

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問14
グループCの各対戦毎にゴール数を表⽰してください。
ゴール数がゼロの場合も表⽰してください。副問合せは使わずに、外部結合だけを使⽤して下さい。
[表⽰するカラム]
・キックオフ⽇時
・⾃国名
・対戦相⼿国名
・⾃国FIFAランク
・対戦相⼿国FIFAランク
・⾃国のゴール数
[ソート順]
・キックオフ⽇時
・⾃国FIFAランク
SQL実⾏結果

SELECT p1.kickoff, c1.name AS my_country, c2.name AS enemy_country,
    c1.ranking AS my_ranking, c2.ranking AS enemy_ranking,
    (SELECT COUNT(g1.id) FROM goals g1 WHERE p1.id = g1.pairing_id) AS my_goals
FROM pairings p1
LEFT JOIN countries c1 ON c1.id = p1.my_country_id
LEFT JOIN countries c2 ON c2.id = p1.enemy_country_id
WHERE c1.group_name = 'C' AND c2.group_name = 'C'
ORDER BY p1.kickoff, c1.ranking

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問15
グループCの各対戦毎にゴール数を表⽰してください。
ゴール数がゼロの場合も表⽰してください。⾃国のゴール数は副問合せを⽤いて表⽰してください。
[表⽰するカラム]
・キックオフ⽇時
・⾃国名
・対戦相⼿国名
・⾃国FIFAランク
・対戦相⼿国FIFAランク
・⾃国のゴール数
[ソート順]
・キックオフ⽇時
・⾃国FIFAランク
SQL実⾏結果

SELECT p1.kickoff, c1.name AS my_country, c2.name AS enemy_country,
    c1.ranking AS my_ranking, c2.ranking AS enemy_ranking,
    (SELECT COUNT(g1.id) FROM goals g1 WHERE p1.id = g1.pairing_id) AS my_goals
FROM pairings p1
LEFT JOIN countries c1 ON c1.id = p1.my_country_id
LEFT JOIN countries c2 ON c2.id = p1.enemy_country_id
WHERE c1.group_name = 'C' AND c2.group_name = 'C'
ORDER BY p1.kickoff, c1.ranking

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問16
グループCの各対戦毎にゴール数を表⽰してください。
ゴール数がゼロの場合も表⽰してください。問15の副問合せを⽤いたSQLにカラムを付けくわえる形で作成してください。
[表⽰するカラム]
・キックオフ⽇時
・⾃国名
・対戦相⼿国名
・⾃国FIFAランク
・対戦相⼿国FIFAランク
・⾃国のゴール数
・対戦国のゴール数（※追加）
[ソート順]
・キックオフ⽇時
・⾃国FIFAランク
SQL実⾏結果

SELECT p1.kickoff, c1.name AS my_country, c2.name AS enemy_country,
    c1.ranking AS my_ranking, c2.ranking AS enemy_ranking,
    (SELECT COUNT(g1.id) FROM goals g1 WHERE p1.id = g1.pairing_id) AS my_goals,
    (
        SELECT COUNT(g2.id)
        FROM goals g2
        LEFT JOIN pairings p2 ON p2.id = g2.pairing_id
        WHERE p2.my_country_id = p1.enemy_country_id AND p2.enemy_country_id = p1.my_country_id
    ) AS enemy_goals
FROM pairings p1
LEFT JOIN countries c1 ON c1.id = p1.my_country_id
LEFT JOIN countries c2 ON c2.id = p1.enemy_country_id
WHERE c1.group_name = 'C' AND c2.group_name = 'C'
ORDER BY p1.kickoff, c1.ranking

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問17
問題16の結果に得失点差を追加してください。
[表⽰するカラム]
・キックオフ⽇時
・⾃国名
・対戦相⼿国名
・⾃国FIFAランク
・対戦相⼿国FIFAランク
・⾃国のゴール数
・対戦国のゴール数
・得失点差（※追加）
[ソート順]
・キックオフ⽇時
・⾃国FIFAランク
SQL実⾏結果

SELECT p1.kickoff, c1.name AS my_country, c2.name AS enemy_country, 
    c1.ranking AS my_ranking, c2.ranking AS enemy_ranking,
    (SELECT COUNT(g1.id) FROM goals g1 WHERE p1.id = g1.pairing_id) AS my_goals,
    (
        SELECT COUNT(g2.id) 
        FROM goals g2 
        LEFT JOIN pairings p2 ON p2.id = g2.pairing_id
        WHERE p2.my_country_id = p1.enemy_country_id AND p2.enemy_country_id = p1.my_country_id
    ) AS enemy_goals,
    -- 追加ここから
    (SELECT COUNT(g1.id) FROM goals g1 WHERE p1.id = g1.pairing_id) - ( 
        SELECT COUNT(g2.id) 
        FROM goals g2 
        LEFT JOIN pairings p2 ON p2.id = g2.pairing_id
        WHERE p2.my_country_id = p1.enemy_country_id AND p2.enemy_country_id = p1.my_country_id
    ) AS goal_diff
    -- 追加ここまで
FROM pairings p1
LEFT JOIN countries c1 ON c1.id = p1.my_country_id
LEFT JOIN countries c2 ON c2.id = p1.enemy_country_id
WHERE c1.group_name = 'C' AND c2.group_name = 'C'
ORDER BY p1.kickoff, c1.ranking

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問18
ブラジル（my_country_id = 1）対クロアチア（enemy_country_id = 4）戦の
キックオフ時間（現地時間）を表⽰してください。
ただし、DB上に保持されているキックオフ時間は⽇本時間であるため、
⽇本と現地の時差であるマイナス12時間をして表⽰すること。
[表⽰するカラム]
・キックオフ時間（現地）
・キックオフ時間（⽇本）
SQL実⾏結果

SELECT p.kickoff, ADDTIME(p.kickoff, '-12:00:00') AS kickoff_jp
FROM pairings p
WHERE p.my_country_id = 1 AND p.enemy_country_id = 4;

SELECT p.kickoff, SUBTIME(p.kickoff, '12:00:00') AS kickoff_jp
FROM pairings p
WHERE p.my_country_id = 1 AND p.enemy_country_id = 4;

SELECT p.kickoff, DATE_ADD(p.kickoff, INTERVAL '-12' HOUR) AS kickoff_jp
FROM pairings p
WHERE p.my_country_id = 1 AND p.enemy_country_id = 4;

SELECT p.kickoff, DATE_SUB(p.kickoff, INTERVAL '12' HOUR) AS kickoff_jp
FROM pairings p
WHERE p.my_country_id = 1 AND p.enemy_country_id = 4;

SELECT p.kickoff, ADDDATE(p.kickoff, INTERVAL '-12' HOUR) AS kickoff_jp
FROM pairings p
WHERE p.my_country_id = 1 AND p.enemy_country_id = 4;

SELECT p.kickoff, SUBDATE(p.kickoff, INTERVAL '12' HOUR) AS kickoff_jp
FROM pairings p
WHERE p.my_country_id = 1 AND p.enemy_country_id = 4;

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問19
年齢ごとの選⼿数を表⽰してください。
年齢はワールドカップ開催当時である2014-06-13を使って算出してください。
SQL実⾏結果

SELECT TIMESTAMPDIFF(YEAR, birth, '2014-06-13') AS age, COUNT(id) AS player_count
FROM players 
GROUP BY age

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問20
年齢ごとの選⼿数を表⽰してください。ただし、10歳毎に合算して表⽰してください。
SQL実⾏結果

SELECT TRUNCATE(TIMESTAMPDIFF(YEAR, birth, '2014-06-13'), -1) AS age, COUNT(id) AS player_count
FROM players 
GROUP BY age

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問21
年齢ごとの選⼿数を表⽰してください。ただし、5歳毎に合算して表⽰してください。
SQL実⾏結果

SELECT FLOOR(TIMESTAMPDIFF(YEAR, birth, '2014-06-13') / 5) * 5   AS age, COUNT(id) AS player_count
FROM players 
GROUP BY age

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問22
以下の条件でSQLを作成し、抽出された結果をもとにどのような傾向があるか考えてみてください。
・5歳単位、ポジションでグループ化
・選⼿数、平均⾝⻑、平均体重を表⽰
・順序は年齢、ポジション
SQL実⾏結果

SELECT FLOOR(TIMESTAMPDIFF(YEAR, birth, '2014-06-13') / 5) * 5   AS age, position, COUNT(id) AS player_count, AVG(height), AVG(weight)
FROM players 
GROUP BY age, position
ORDER BY age, position
//1.GKは他のポジションに比べて年齢的なハンデが低い（35歳代ではもっとも人数が多い）
//2.GKは若年層が極端に少なく、天性の素質よりも経験値が大きく影響する可能性が高い
//3.DFは年齢が上がるにつれ身長が低くなる（つまり身体的な優位性以外の経験などが重視される）が、35歳以上では身体的な優位性も必要となる
//4.MF、FWは一部例外があるものの年齢が上がるにつれて身長が高くなるため、若年世代では特に身体的な優位性よりも天性の素質やスピード面での優位性などが重要視される可能性が高い
//5.FWは20～34まで人数がそれほど大きく変わらない。これは様々なタイプの選手（若くて走れる選手、背が高く競り勝てる選手など）が求められる可能性が高い


ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問23
⾝⻑の⾼い選⼿ベスト5を抽出し、以下の項⽬を表⽰してください。
・名前
・⾝⻑
・体重
SQL実⾏結果

SELECT name, height, weight
FROM players
ORDER BY height DESC
LIMIT 5

ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

問24
⾝⻑の⾼い選⼿6位〜20位を抽出し、以下の項⽬を表⽰してください。
・名前
・⾝⻑
・体重

SELECT name, height, weight
FROM players
ORDER BY height DESC
LIMIT 5, 15
ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
