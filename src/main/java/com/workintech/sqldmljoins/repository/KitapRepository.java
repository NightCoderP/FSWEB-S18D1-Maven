package com.workintech.sqldmljoins.repository;

import com.workintech.sqldmljoins.entity.Kitap;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface KitapRepository extends JpaRepository<Kitap, Long> {

    // 1) Dram ve Hikaye türündeki kitapları listeleyin. JOIN kullanmadan yapın.
    String QUESTION_1 =
            "SELECT * FROM kitap " +
            "WHERE turno IN (" +
            "  SELECT turno FROM tur WHERE ad IN ('Dram','Hikaye')" +
            ")";

    @Query(value = QUESTION_1, nativeQuery = true)
    List<Kitap> findBooks();

    // 10) Tüm kitapların ortalama puanını bulunuz (19,42 formatı)
    // 10) Tüm kitapların ortalama puanını bulunuz
    String QUESTION_10 =
            "SELECT REPLACE(TO_CHAR(ROUND(CAST(AVG(puan) AS numeric), 2), 'FM999999990.00'), '.', ',') FROM kitap";


    @Query(value = QUESTION_10, nativeQuery = true)
    String findAvgPointOfBooks();
}