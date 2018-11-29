-- ストアドプロシージャ(stored procedure)
-- を使うと一連の手順を記録し、まとめて実行することができる
-- 同じSQLコマンドを何回も実行しているな・・・と思ったらその処理を
-- ストアドプロシージャにしておきましょう。

-- 「CALL ××」というコマンドを使うだけで、定義した処理をすぐに使うことができる

-- ***************************************************************************************
-- delimiter //
-- create procedure pr1()
--     begin
--         select * from tb;
--         select * from tb1;
--     end//
-- delimiter ;

-- call pr1;
-- を実行すれば、begin～end内の2つのselect文が実行されるよ。
-- begin～endまでの内容がストアドプロシージャの本体です。
-- しかしながら、sql文の終了は「;」で表現せざるを得ないため
-- 何もしなければ　select * from tb;で終わってしまうことになる。
-- SQL文は「;」が入力されればどんな内容であろうと
-- とりあえずそこまでの内容を実行してしまうという特性がある
-- それでは困るので、頭に「delimiter //」と記述する必要があります。
-- こうしておけば文の終わりは//になり、begin~endの途中で終わることがなくなる。
-- endしたら、もう一度delimiterで「；」に戻しておきましょう。

-- **************************************************************************************
-- 引数を指定して実行するパターン

-- delimiter //
-- create procedure pr2(d int)
--     begin
--         select * from tb where uria>=d;
--     end//
-- delimiter ;

-- このストアドプロシージャに対し、call pr2(200);
-- とすれば、引数を渡せるよ。

-- ***************************************************************************************
-- ストアドプロシージャの内容確認
-- show create procedure pr1;

-- ***************************************************************************************
-- ストアドプロシージャの削除
-- drop procedure pr1;

