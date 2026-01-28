package com.workintech.sqldmljoins.repository;

import com.workintech.sqldmljoins.entity.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OgrenciRepository extends JpaRepository<Ogrenci, Long> {

    // 2) Kitap alan öğrencilerin öğrenci bilgilerini listeleyin.
    // 8 bekleniyor -> duplicate olmasın diye EXISTS
    String QUESTION_2 =
        "SELECT o.* " +
        "FROM ogrenci o " +
        "WHERE EXISTS (SELECT 1 FROM islem i WHERE i.ogrno = o.ogrno) " +
        "ORDER BY o.ogrno";

    @Query(value = QUESTION_2, nativeQuery = true)
    List<Ogrenci> findStudentsWithBook();

    // 3) Kitap almayan öğrencileri listeleyin.
    String QUESTION_3 =
            "SELECT o.* " +
            "FROM ogrenci o " +
            "WHERE NOT EXISTS (SELECT 1 FROM islem i WHERE i.ogrno = o.ogrno) " +
            "ORDER BY o.ogrno";

    @Query(value = QUESTION_3, nativeQuery = true)
    List<Ogrenci> findStudentsWithNoBook();

    // 4) 10A veya 10B sınıfındaki öğrencilerin sınıf ve okuduğu kitap sayısını getirin.
    // alias: sinif, count (projection için)
    String QUESTION_4 =
            "SELECT o.sinif AS sinif, COUNT(i.kitapno) AS count " +
            "FROM ogrenci o " +
            "JOIN islem i ON i.ogrno = o.ogrno " +
            "WHERE o.sinif IN ('10A','10B') " +
            "GROUP BY o.sinif " +
            "ORDER BY o.sinif";

    @Query(value = QUESTION_4, nativeQuery = true)
    List<KitapCount> findClassesWithBookCount();

    // 5) Öğrenci tablosundaki öğrenci sayısını gösterin
    String QUESTION_5 = "SELECT COUNT(*) FROM ogrenci";

    @Query(value = QUESTION_5, nativeQuery = true)
    Integer findStudentCount();

    // 6) Öğrenci tablosunda kaç farklı isimde öğrenci olduğunu listeleyiniz.
    String QUESTION_6 = "SELECT COUNT(DISTINCT ad) FROM ogrenci";

    @Query(value = QUESTION_6, nativeQuery = true)
    Integer findUniqueStudentNameCount();

    // 7) İsme göre öğrenci sayılarının adedini bulunuz.
    // alias: ad, count
    String QUESTION_7 =
            "SELECT ad AS ad, COUNT(*) AS count " +
            "FROM ogrenci " +
            "GROUP BY ad " +
            "ORDER BY ad";

    @Query(value = QUESTION_7, nativeQuery = true)
    List<StudentNameCount> findStudentNameCount();

    // 8) Her sınıftaki öğrenci sayısını bulunuz.
    // alias: sinif, count
    String QUESTION_8 =
        "SELECT sinif AS sinif, COUNT(*) AS count " +
        "FROM ogrenci " +
        "GROUP BY sinif " +
        "ORDER BY sinif DESC";

    @Query(value = QUESTION_8, nativeQuery = true)
    List<StudentClassCount> findStudentClassCount();

    // 9) Her öğrencinin ad soyad karşılığında okuduğu kitap sayısını getiriniz.
    // Hülya ilk gelsin -> ogrno ile sırala
    // alias: ad, soyad, count
    String QUESTION_9 =
        "SELECT o.ad AS ad, o.soyad AS soyad, COUNT(i.kitapno) AS count " +
        "FROM ogrenci o " +
        "LEFT JOIN islem i ON i.ogrno = o.ogrno " +
        "GROUP BY o.ogrno, o.ad, o.soyad " +
        "ORDER BY o.ogrno";;

    @Query(value = QUESTION_9, nativeQuery = true)
    List<StudentNameSurnameCount> findStudentNameSurnameCount();
}