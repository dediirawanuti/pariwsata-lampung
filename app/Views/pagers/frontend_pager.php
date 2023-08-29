<?php $pager->setSurroundCount(2); ?>

<nav class="flex items-center justify-center mt-8" aria-label="Pagination">
    <ul class="pagination">
        <?php if ($pager->hasPrevious()) : ?>
            <li>
                <a href="<?= $pager->getPrevious(); ?>" class="pagination-link" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
        <?php endif; ?>

        <?php foreach ($pager->links() as $link) : ?>
            <li>
                <a href="<?= $link['uri']; ?>" class="pagination-link <?= $link['active'] ? 'active' : ''; ?>">
                    <?= $link['title']; ?>
                </a>
            </li>
        <?php endforeach; ?>

        <?php if ($pager->hasNext()) : ?>
            <li>
                <a href="<?= $pager->getNext(); ?>" class="pagination-link" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        <?php endif; ?>
    </ul>
</nav>